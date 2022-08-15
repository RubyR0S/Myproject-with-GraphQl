# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin '@apollo/client', to: 'https://ga.jspm.io/npm:@apollo/client@3.6.7/index.js'
pin '@wry/context', to: 'https://ga.jspm.io/npm:@wry/context@0.6.1/lib/context.esm.js'
pin '@wry/equality', to: 'https://ga.jspm.io/npm:@wry/equality@0.5.3/lib/equality.esm.js'
pin '@wry/trie', to: 'https://ga.jspm.io/npm:@wry/trie@0.3.2/lib/trie.esm.js'
pin 'graphql', to: 'https://ga.jspm.io/npm:graphql@16.5.0/index.mjs'
pin 'graphql-tag', to: 'https://ga.jspm.io/npm:graphql-tag@2.12.6/lib/index.js'
pin 'optimism', to: 'https://ga.jspm.io/npm:optimism@0.16.1/lib/bundle.cjs.js'
pin 'react', to: 'https://ga.jspm.io/npm:react@18.2.0/index.js'
pin 'symbol-observable', to: 'https://ga.jspm.io/npm:symbol-observable@4.0.0/lib/index.js'
pin 'ts-invariant', to: 'https://ga.jspm.io/npm:ts-invariant@0.10.3/lib/invariant.js'
pin 'ts-invariant/process/index.js', to: 'https://ga.jspm.io/npm:ts-invariant@0.10.3/process/index.js'
pin 'tslib', to: 'https://ga.jspm.io/npm:tslib@2.4.0/tslib.es6.js'
pin 'zen-observable-ts', to: 'https://ga.jspm.io/npm:zen-observable-ts@1.2.5/module.js'
