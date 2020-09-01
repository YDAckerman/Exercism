def proteins(strand):

    codon_dict = {'AUG':'Methionine', 'UUU':'Phenylalanine', 'UUC':'Phenylalanine',
                  'UUA':'Leucine', 'UUG':'Leucine', 'UCU':'Serine', 'UCC':'Serine',
                  'UCA':'Serine', 'UCG':'Serine', 'UAU':'Tyrosine','UAC':'Tyrosine',
                  'UGU':'Cysteine', 'UGC':'Cysteine', 'UGG':'Tryptophan',
                  'UAA':'STOP', 'UAG':'STOP', 'UGA':'STOP'}

    codons = chunkN(strand, 3)
    codons.reverse()
    protein = []

    proceed = True
    while(proceed and len(codons) > 0):
        codon = codons.pop()
        if(codon_dict[codon] is not 'STOP'):
            protein.append(codon_dict[codon])
        else :
            proceed = False

    return protein

def chunkN(x, n):
    i = 0
    chunks = []
    while(i < len(x)):
        chunks.append(x[i:(min(i + n, len(x)))])
        i = i + n
    return chunks
