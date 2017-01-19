sub sieve {
    my ($size) = @_;
    return () if ($size <= 0);
    return (0) if ($size == 1);
    my @sieveArray = ();
    $sieveArray[0] = $sieveArray[1] = 0;
    $sieveArray[$_] = 1 for (2 .. ($size - 1));
    my $root = (sqrt($size) | 0) + 1;
    for (my $i = 2; $i < $root; ++$i) {
        next if (!$sieveArray[$i]);
        for (my $j = $i * $i; $j < $size; $j += $i) {
            $sieveArray[$j] = 0;
        }
    }
    return @sieveArray;
}

sub countPrime {
    my ($n) = @_;
    my $count = 0;
    for (sieve($n + 1)) {
        ++$count if ($_);
    }
    return $count
}

my $n = (@ARGV >= 1) ? $ARGV[0] : 10000000;
print countPrime($n), "\n";