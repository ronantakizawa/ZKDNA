pragma circom 2.0.0;

include "circomlib/circuits/comparators.circom";

template DnaMutation(L) {
    // Parameters:
    // L: Length of the DNA sequences

    // Inputs (all private in this component unless specified as public in main)
    signal input S_mut[L];  // Mutated DNA sequence

    // Signals
    signal position_indicator[L];
    component isEqualN[L];

    // Inputs for public signals passed from main
    signal input S_ref[L];  // Reference DNA sequence
    signal input N;         // Mutation position
    signal input M;         // Mutated nucleotide value

    for (var i = 0; i < L; i++) {
        // Instantiate IsEqual component to compare N and i
        isEqualN[i] = IsEqual();
        isEqualN[i].in[0] <== N;
        isEqualN[i].in[1] <== i;
        position_indicator[i] <== isEqualN[i].out;

        // Enforce constraints
        // At position N: S_mut[N] == M
        // At other positions: S_mut[i] == S_ref[i]
        position_indicator[i] * (S_mut[i] - M) === 0;
        (1 - position_indicator[i]) * (S_mut[i] - S_ref[i]) === 0;
    }
}

// Instantiate the main component and specify public inputs
component main {public [S_ref, N, M]} = DnaMutation(10);