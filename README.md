
# Dictionary Learning with Low Mutual Coherence Constraint

This repository contains MATLAB functions and a demo script implementing and testing the low-coherence dictionary learning (DL) algorithms proposed in [1], namely, constrained incoherent DL (`CINC-DL`) and regularized incoherent DL (`RINC-DL`). We have also implemented the algorithms proposed in [2], bounded self-coherence DL (`BSC-DL`) as well as [3], iterative projections and rotations DL (`IPR-DL`), for comparison.

**Copyright notice:** We have largely used the the OMP and KSVD implementations written by [Ron Rubinstein](https://www.cs.technion.ac.il/~ronrubin/) to write our codes.

## Installation

Prior to use this package, you need to install the [OMP and KSVD toolboxes](https://www.cs.technion.ac.il/~ronrubin/software.html). Then, to install the current package, simply run `setup.m`.

## Package description

- `DL_algorithms`: MATLAB implementations of our proposed low-coherence dictionary learning algorithms, namely, `RINC-DL` and `CINC-DL`, together with two existing algorithms, namely, `BSC-DL` [2] and `IPR-DL` [3].

- `Test_images`: natural images used to test different low-coherence DL algorithms.

- `demo.m`: demo script to apply different low-coherence DL algorithms on natural image patches.

## References

[1] M. Sadeghi and M. Babaie-Zadeh, [Dictionary learning with low mutual coherence constraint](https://www.sciencedirect.com/science/article/pii/S0925231220307827), Neurocomputing, vol. 407, pp. 163-174, September 2020.

[2] C. D. Sigg, T. Dikk, and J. M. Buhmann, [Learning dictionaries with bounded self-coherence](https://ieeexplore.ieee.org/document/6328247), IEEE Signal Proc. Letters, vol. 19, no. 12, pp. 861-864, 2012.

[3] D. Barchiesi and M. D. Plumbley, [Learning incoherent dictionaries for sparse approximation using iterative projections and rotations](https://ieeexplore.ieee.org/document/6451295/), IEEE Trans. on Signal Proc., vol. 61, no. 8, pp. 2055-2065, 2013.

## Contact

Mostafa Sadeghi - mostafa[dot]sadeghi[at]inria[dot]fr
