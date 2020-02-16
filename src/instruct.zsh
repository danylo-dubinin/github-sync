#!/usr/bin/env zsh

function instruct {
  awk -F $'\t' '
    $1 { print "clone"  , $1 }
    $2 { print "remove" , $2 }
    $3 { print "fetch"  , $3 }
  ' \
    | sort
}

if (($# == 0)) { instruct } else { instruct <<< $@ }
