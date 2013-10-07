#!/bin/sh
gocms -input=src/home.html -output=index.html -template=src/layout.html
gocms -input=src/docs/tutorial.html -output=docs/tutorial.html -template=src/layout.html
gocms -input=src/docs/index.html -output=docs/index.html -template=src/layout.html
gocms -input=src/docs/configuration.html -output=docs/configuration.html -template=src/layout.html
