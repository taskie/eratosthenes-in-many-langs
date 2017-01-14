<?php
function sieve($size) {
    if ($size <= 0) return array();
    if ($size == 1) return array(FALSE);
    $sieveArray = array_fill(0, $size, TRUE);
    $sieveArray[0] = $sieveArray[1] = FALSE;
    $root = (sqrt($size) | 0) + 1;
    for ($i = 2; $i < $root; ++$i) {
        if (!$sieveArray[$i]) continue;
        for ($j = $i * $i; $j < count($sieveArray); $j += $i) {
            $sieveArray[$j] = FALSE;
        }
    }
    return $sieveArray;
}

function countPrime($n) {
    $count = 0;
    foreach (sieve($n + 1) as $p) {
        if ($p) ++$count;
    }
    return $count;
}

$n = ($argc >= 2) ? $argv[1] : 10000000;
echo countPrime($n) . "\n";