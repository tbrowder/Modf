unit module Modf:ver<0.0.1>:auth<zef:tbrowder>;


sub modf($x is copy, $places? --> List) is export {
    # returns the integer and fractional parts of x
    # special cases:
    #   the real part will be an integer
    #   the fractional part will be a decimal with leading '0.'
    #   zero values are '0' and are unsigned
    #   both parts take the sign of x unless they are zero
    $x .= Real;

    my $sign = $x.sign;
    $x .= abs; # now signless

    # operate on absolute parts
    my $int  = $x.Int;
    my $frac = $x - $int;

    # restore original sign
    $int  *= $sign;
    $frac *= $sign;
    $int  = 0 if $int  == 0;
    $frac = 0 if $frac == 0;

    if $places.defined and $places > 0 {
        $frac = sprintf '%.*f', $places, $frac;
    }

    $int, $frac

} # sub modf
