#!/usr/bin/perl

=encoding utf8

=head1 NAME

script.pl

=head1 SYNOPSIS

    script.pl [--help]

=head1 DESCRIPTION

Skeleton for a perl script

=head1 LICENSE

This is released under the MIT
License. See L<https://opensource.org/licenses/MIT>.

=head1 AUTHOR

João Costa - L<http://zonalivre.org/>

=head1 SEE ALSO

=cut


use strict;
use warnings;
use Log::Log4perl;
use Getopt::Long;

my @list;
my %options = (
    verbose         => 0,
    optionString    => "A String value",
    optionNumber    => 10,
    optionList      => \@list,
);

GetOptions(
    \%options,
    "help"      => sub { Getopt::Long::HelpMessage() },
    "verbose",
    "mandatoryOption=s",
    "optionString=s",
    "optionNumber=i",
    "optionList=s@",
) or Getopt::Long::HelpMessage(2);

warn("Mandatory option `mandatoryOption` not provided\n") && GetOpt::Long::HelpMessage(1) unless ($options{mandatoryOption});

my $log_level = $ENV{LOG_LEVEL} // 'INFO';
# Initialize Logger
my $log_conf = qq(
log4perl rootLogger = $log_level, SCREEN
log4perl.appender.SCREEN         = Log::Log4perl::Appender::Screen
log4perl.appender.SCREEN.stderr  = 0
log4perl.appender.SCREEN.layout  = Log::Log4perl::Layout::PatternLayout
log4perl.appender.SCREEN.layout.ConversionPattern = \%d{yyyy-MM-dd HH:mm:ss,S Z} \%m \%n
);

Log::Log4perl::init(\$log_conf);
my $l = Log::Log4perl->get_logger();

foreach my $option (sort keys %options){
    print "$option\t= $options{$option}\n";
}
