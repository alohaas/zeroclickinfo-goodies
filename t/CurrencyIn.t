#!/usr/bin/env perl

use strict;
use warnings;
use Test::More;
use DDG::Test::Goodie;

zci answer_type => 'currency_in';
zci is_cached => 1;

ddg_goodie_test(
        [qw(
                DDG::Goodie::CurrencyIn
        )],
        'currency in australia' => test_zci('The currency in Australia is the Australian dollar (AUD)', html => 'The currency in Australia is the Australian dollar (AUD)'),
        'currency in AU' => test_zci('The currency in Australia is the Australian dollar (AUD)', html => 'The currency in Australia is the Australian dollar (AUD)'),
        'currency in poland' => test_zci("The currency in Poland is the Polish z\x{0142}oty (PLN)", html => "The currency in Poland is the Polish z\x{0142}oty (PLN)"),
        'currency in venezuela' => test_zci("The currency in Venezuela is the Venezuelan bol\x{00ED}var (VEF)", html => "The currency in Venezuela is the Venezuelan bol\x{00ED}var (VEF)"),
        'currency In Alderney' => test_zci("Currencies in Alderney are: \nAlderney pound\nBritish pound (GBP)\nGuernsey pound", html => "Currencies in Alderney are: <br/>Alderney pound<br/>British pound (GBP)<br/>Guernsey pound")
);

done_testing;
