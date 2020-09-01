def to_rna(dna_strand):
    if not is_dna(dna_strand):
        raise Exception("The string provided is not DNA")
    else:
        rna = [transcribe(letter) for letter in dna_strand]
        return(''.join(rna))

def is_dna(dna_strand):
    return(all([letter in "ATCG" for letter in dna_strand]))

def transcribe(letter):
    if letter == 'G':
        return('C')
    if letter == 'C':
        return('G')
    if letter == 'T':
        return('A')
    if letter == 'A':
        return('U')
