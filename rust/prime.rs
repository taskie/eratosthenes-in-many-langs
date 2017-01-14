#![feature(step_by)]
use std::cmp;
use std::env;

fn sieve(size: usize) -> Vec<bool> {
    let mut sieve_array = vec![true; size];
    for i in 0..cmp::min(2, size) {
        sieve_array[i] = false;
    }

    let root: usize = ((size as f64).sqrt() as usize) + 1;
    for i in 2..root {
        if sieve_array[i] {
            for j in ((i * i)..size).step_by(i) {
                sieve_array[j] = false;
            }
        }
    }
    
    return sieve_array;
}

fn count_prime(n: usize) -> usize {
    return sieve(n + 1).iter().filter(|&x| *x).count();
}

fn main() {
    let n = env::args().nth(1)
      .and_then(|s| usize::from_str_radix(s.as_str(), 10).ok())
      .unwrap_or(10000000usize);
    println!("{}", count_prime(n));
}
