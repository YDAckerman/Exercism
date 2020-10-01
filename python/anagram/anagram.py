def find_anagrams(word, candidates):
    t = lambda x: "".join(sorted(x.lower()))
    f = lambda c: t(c) == t(word) and c.lower() != word.lower()
    return [c for c in candidates if f(c)]
    
