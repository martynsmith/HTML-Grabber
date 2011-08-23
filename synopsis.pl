#!/usr/bin/perl

use strict;
use warnings;

use HTML::Grabber;
use LWP::Simple;

my $dom = HTML::Grabber->new( html => get('http://twitter.com/ned0r') );

$dom->find('li.status')->each(sub {
    my $body = $_->find('.entry-content')->text;
    my $when = $_->find('.entry-date')->text;
    my $link = $_->find('a[rel="bookmark"]')->attr('href');
    print "$body $when (link: $link)\n";
});

