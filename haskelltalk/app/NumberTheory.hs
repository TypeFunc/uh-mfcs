module NumberTheory where

import Math.NumberTheory.Primes.Factorisation (factorise, factorSieve, sieveFactor, smallFactors)
import Math.NumberTheory.ArithmeticFunctions (totient)
import Math.NumberTheory.GCD (binaryGCD, coprime)
import qualified Math.NumberTheory.GaussianIntegers as G
import Math.NumberTheory.Moduli (chineseRemainder)

-- Find the prime factorization of a number using the elliptic curve method described here:
-- http://programmingpraxis.com/2010/04/23/modern-elliptic-curve-factorization-part-1/
-- http://programmingpraxis.com/2010/04/27/modern-elliptic-curve-factorization-part-2/
factorization1 = factorise 123456789 -- [(3,2),(3607,1),(3803,1)]
factorization2 = factorise 987654321 -- [(3,2),(17,2),(379721,1)]

sieve = factorSieve 1000 -- precompute a list of prime number up to n
-- Then factor using a prime sieve at first, then switch to elliptic curve method.
factorization3 = sieveFactor sieve 123456789 -- [(3,2),(3607,1),(3803,1)]
factorization4 = sieveFactor sieve 987654321 -- [(3,2),(17,2),(379721,1)]

-- We can do partial factorization
smallfactors1 = smallFactors 1000 123456789 -- ([(3,2)],Just 13717421)
smallfactors2 = smallFactors 1000 987654321 --([(3,2),(17,2),(379721,1)],Nothing)

tot1, tot2 :: Integer -- Note: need a type signature due to ambiguous type of numeric literals
tot1 = totient 123456789 -- 82260072
tot2 = totient 987654321 -- 619703040

thegcd :: Integer
thegcd = binaryGCD 123456789 987654321 -- 9 = 3^2

iscoprime :: Bool
iscoprime = coprime (123456789 :: Integer) (987654321 :: Integer) -- False

gprimes10 :: [G.GaussianInteger]
gprimes10 = take 10 G.primes -- [1+ι,3,1+2*ι,2+ι,7,11,3+2*ι,2+3*ι,4+ι,1+4*ι]

-- Can we find an integer n such that n = 1 mod 2, n = 2 mod 3, etc.?
solution = chineseRemainder [(1,2), (2,3), (3,5), (4,7), (5,11)] -- Just 1523
