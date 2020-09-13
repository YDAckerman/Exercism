import re

class SgfTree:
    def __init__(self, properties=None, children=None):
        self.properties = properties or {}
        self.children = children or []

    def __eq__(self, other):
        if not isinstance(other, SgfTree):
            return False
        for k, v in self.properties.items():
            if k not in other.properties:
                return False
            if other.properties[k] != v:
                return False
        for k in other.properties.keys():
            if k not in self.properties:
                return False
        if len(self.children) != len(other.children):
            return False
        for a, b in zip(self.children, other.children):
            if a != b:
                return False
        return True

    def __ne__(self, other):
        return not self == other


def parse(input_string):

    if input_string in ["()", ";", ""]:
        raise ValueError("The SGF string supplied is empty")

    if input_string == "(;)":
        return SgfTree()
    
    head,tail = getHeadTail(input_string)

    print(toProps(head))
    print(tail)    
    if tail[0:2] == "((":
        ## split up and recurse on each branch
        branches = getBranches(tail[1:(len(tail) - 1)])
        return SgfTree(properties = toProps(head),
                       children = [parse(branch) for branch in branches])
    elif tail == "()":
        return SgfTree(properties = toProps(head))
    else:
        return SgfTree(properties = toProps(head),
                       children = [parse(tail)])

def getBranches(sgf_string):
    """
    Take an sgf string and break it's parentheses structure into a list
    """
    # if not node: return [sgf_string]
    op = 0
    contents = ""
    parts = []
    for c in sgf_string:
        contents += c
        if c == '(':
            op += 1
        if c == ')':
            op -= 1
            if op == 0:
                parts.append(contents)
                contents = ""
    return parts

def getHeadTail(input_string):
    head = re.search(r";([A-Z0-9]+(\[[\]\t\s\\n0-9A-Za-z]+\])+)+",
                     input_string)
    if isinstance(head, type(None)):
        raise ValueError("no valid properties for a node")
    head = head.group(0)
    tail = input_string.replace(head, "")
    return head,tail

def toProps(prop_string):
    pairs = []
    for m in re.finditer(r"[A-Z]+(\[[\]\t\s\\n0-9A-Za-z]+\])+", prop_string):
        pairs.append(m.group(0))
    prop = {getKey(pair):getVals(pair) for pair in pairs}
    return prop 

def getVals(pair):
    vals = re.findall(r"\[[\]\t\s\\n0-9A-Za-z]+\]", pair)
    return [val[1:(len(val)-1)] for val in vals]

def getKey(pair):
    ## return re.search(r"(?<!\()\b[A-Z]+\b(?![0-9a-zA-Z]*[\)])", pair).group(0)
    return re.search(r"[A-Z0-9]+", pair).group(0)

def main():
    ## x = "(;A[\\]b\nc\nd\t\te \n\\]])"
    x = "(;A[B];B[C])"
    parse(x)

if __name__ == "__main__":
    main()
        
            
        
        
        
        
    
        
