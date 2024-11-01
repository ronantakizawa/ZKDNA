# Proof of DNA Mutation using Groth16 ZK Proof

https://ronantakizawa.github.io/ZKDNA/

This ZK proof system proves that a DNA sequence has undergone a specific mutation at a specified position without revealing other details of the sequence.

Input Explanations:
S_ref: This is the original DNA sequence, represented as an array of 10 integers. Each number corresponds to a specific nucleotide.
N: This is the mutation position in the DNA sequence, given as a zero-based index from 0 to 9. It indicates where the mutation occurs.
M: This is the mutated nucleotide value. At position N, the original nucleotide is replaced with this value.
S_mut: This is the mutated DNA sequence. It should be identical to S_ref except at the mutation position N, where the value should equal M.

For a ZK proof to be valid in this circuit, the following conditions must be met:

Sequence Length Consistency: Both S_ref and S_mut must contain exactly 10 elements. Any other length will cause the proof to be invalid.
Mutation Consistency: The value at position N in S_mut must match M. For all other positions, S_mut should be identical to S_ref. If any other elements differ, the proof will be invalid.
Mutation Position: The index N must be within the range 0 to 9 (inclusive). Any value outside this range will cause an error since it doesn't align with the 10-element sequence structure.
Nucleotide Encoding: Although not strictly necessary, using only values 0, 1, 2, and 3 for S_ref and S_mut maintains consistency with the DNA encoding. If other numbers are used without consistent rules, the meaning of the proof may become ambiguous.
By following these constraints, the ZK proof verifies that a valid mutation has occurred in S_mut at position N, with S_ref remaining identical otherwise, ensuring DNA sequence integrity for all non-mutated positions.

<img width="769" alt="Screenshot 2024-10-31 at 10 03 56 PM" src="https://github.com/user-attachments/assets/f62106cf-cc45-4c2a-a7cb-ee156550bbce">
