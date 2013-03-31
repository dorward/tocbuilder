#!/usr/bin/perl
use strict;
use HTML::TreeBuilder 3;
use Getopt::Std;

#######################################
# TOC Builder
#
# Generates a list of links to headings
# in a document.
#
# David Dorward
# http://dorward.me.uk/
#######################################

my $version = 0.3;

unless ($#ARGV > -1) {
  print STDERR qq(No filenames specified\n);
  exit;
}

foreach my $file_name (@ARGV) {
  my $tree = HTML::TreeBuilder->new;
  unless ($tree->parse_file($file_name)) {
    print STDERR qq(Could not build tree from $file_name. Does it exist?\n);
    exit;
  }
  print qq(<ul>);
  my $level = 0;
  my $openitem = 0;
  my @meta = $tree->find_by_tag_name('h1','h2','h3','h4','h5','h6');
  for (@meta) {
    unless ($_->attr('id')) {
      print STDERR qq(Warning: Heading ") . $_->as_text . qq(" missing id\n);
    } else {
      my $newLevel = substr($_->tag(), 1, 1);
      my $i = $newLevel;
      unless ($level == 0) {
	while ($i != $level) {
	  if ($i < $level) {
	    print qq(</li>\n</ul>);
	    $i++;
	  } elsif ($i > $level) {
	    print qq(\n<ul>);
	    $i--;
	    $openitem = 0;
	  }
	}
      }
      if ($openitem) {
	print "</li>";
      }
      print qq(\n<li><a href="#) . $_->attr('id') . qq(">) . $_->as_text . qq(</a>);
      $openitem = 1;
      $level = $newLevel;
    }
  }
  while ($level != 0) {
    print qq(\n</li></ul>);
    $level--;
  }
  print qq(\n);
  $tree = $tree->delete;
}

