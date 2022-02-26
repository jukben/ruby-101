module Complement
  @rna = 'GCTA'
  @dna = 'CGAU'

  def self.of_dna(dna)
    dna.tr(@rna, @dna)
  end
end
