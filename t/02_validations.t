use strict;
use Test::More;

use Date::Japanese::Era;

use utf8;
my @valid = (
    [ '明治', 45, 7,  29 ],
    [ '大正', 1,  7,  30 ],
    [ '大正', 14, 12, 24 ],
    [ '昭和', 1,  12, 25 ],
    [ '昭和', 64, 1,  7 ],
    [ '平成', 1,  1,  8 ],
    [ '平成', 31, 4,  30 ],
    [ '令和', 1,  5,  1 ],
);

for my $test (@valid) {
    my $e = Date::Japanese::Era->is_valid(@$test);
    is $e->isa('Date::Japanese::Era'), 1, 'valid';
}

my @invalid = (
    [ '大正', 1,  7,  29 ],
    [ '明治', 45, 7,  30 ],
    [ '昭和', 1,  12, 24 ],
    [ '大正', 15, 12, 25 ],
    [ '平成', 1,  1,  7 ],
    [ '昭和', 64, 1,  8 ],
    [ '令和', 1,  4,  30 ],
    [ '平成', 31, 5,  1 ],
);

for my $test (@invalid) {
    my $e = Date::Japanese::Era->is_valid(@$test);
    is $e, undef, 'invalid';
}

done_testing;
