[![Actions Status](https://github.com/tbrowder/Modf/workflows/test/badge.svg)](https://github.com/tbrowder/Modf/actions)

Modf
====

This module Provides a Raku version of routine 'modf' as used in other languages.

Note the `modf` routine is **not** currently available in the Raku core, but there is an open Rakudo Pull Request (#4434) to add it. Thus it is likely to be in the core by the 2021.07 release of Rakudo.

SYNOPSIS
========

```raku
use Modf;
say modf(3.2);            # OUTPUT: «3 0.2␤»
say modf(-3.2);           # OUTPUT: «-3 -0.2␤»
```

DESCRIPTION
===========

modf
----

```raku
sub modf($x is copy, $places? --> List) is export(:modf) {...}
=begin code

The c<modf> routine (currently not available in the I<Raku> core) is
similar to those in other languages including I<C>, I<C++>, I<Python>,
and I<Haskell>. It coerces its input into a base 10 number and returns
the integral and fractional parts in a list as shown below. (Note the
C<modf> routine has been submitted as a PR for the Raku core and may
be part of the language soon.)

=begin code :lang<raku>
say modf(3.24);  # OUTPUT: «3 0.24␤»
say modf(-2.7);  # OUTPUT: «-2 -0.7␤»
say modf(10);    # OUTPUT: «10 0␤»
say modf(0x10);  # OUTPUT: «16 0␤»
say modf(-0o10); # OUTPUT: «-8 0␤»
```

Note the sign of the input value is applied to both parts, unless the part is zero. As expected, the fractional part of an integer will be zero. If desired, the user may use the optional parameter `$places` (a positive integer) to specify the precision to be shown in the fractional part.

```raku
say modf(1.23456);    # OUTPUT: «1 0.23456␤»
say modf(1.23456, 3); # OUTPUT: «1 0.235␤»
```

AUTHOR
======

Tom Browder <tbrowder@cpan.org>

COPYRIGHT AND LICENSE
=====================

© 2021 Tom Browder

This library is free software; you can redistribute it or modify it under the Artistic License 2.0.

