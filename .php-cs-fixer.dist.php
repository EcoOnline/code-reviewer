<?php

$rules = require __DIR__ . '/src/rules.php';
$finder = Symfony\Component\Finder\Finder::create()
    ->in(__DIR__)
    ->exclude(['bootstrap', 'storage', 'vendor'])
    ->name('*.php')
    ->notName('*.blade.php')
    ->ignoreDotFiles(true)
    ->ignoreVCS(true);

$config = new PhpCsFixer\Config();

return $config->setRules($rules)->setFinder($finder);
