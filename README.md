# Vandiver verification

PARI/GP scripts and results accompanying *Density of Vanishing of Certain
Eigenspaces of Cyclotomic Class Groups*, by Xuejun Guo and Zhengyu Tao.

- `verify_A34.gp`: tests the vanishing of A34 at p = 151628697551.
- `verify_overlap_100000.gp`: finds primes shared by distinct even-indexed
  Bernoulli numerators through index 100000.
- `verification-100000.txt`: the original complete overlap result.

## Run

Requires 64-bit PARI/GP. From this directory:

```sh
gp verify_A34.gp
gp verify_overlap_100000.gp
```

The first script prints `PASS` or `INCONCLUSIVE`. The second overwrites
`verification-100000.txt` on successful completion.

The recorded overlap result contains 5433 primes; the largest is 204316603.
The overlap calculation requires substantial time and memory. The supplied
result was produced by an earlier optimized implementation; the current
scripts have not been rerun at full size.
