use 5.006;
use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'MooseX::Registry',
    AUTHOR              => q{Rob Brown <rob@intelcompute.com>},
    VERSION_FROM        => 'lib/MooseX/Registry.pm',
    ABSTRACT_FROM       => 'lib/MooseX/Registry.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
        'Moose::Role' => 0,
        'MooseX::Singleton' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'MooseX-Registry-*' },
);
