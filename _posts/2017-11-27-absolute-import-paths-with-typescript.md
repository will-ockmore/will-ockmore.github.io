---
layout: post
title:  "Absolute import paths with typescript"
date:   2017-11-04 10:18:00
categories: React Typescript Tooling Javascript
---

Nowadays, front end projects seems to be getting bigger all the time. When you have hundreds of files, and too many project subdirectories, a common problem is long relative imports; eg:

```
import { foo } from '../../../../../bar/baz/utils';
```

Nobody likes reading these! (Particularly if you come from other languages where this isn't necessary.)

Wouldn't it be better if instead, we could just do...

```
import { foo } from 'src/bar/baz/utils';
```

If you use webpack, to allow the bundler to resolve these paths you just need to add an [alias](https://webpack.js.org/configuration/resolve/#resolve-alias) in your config:

```
// webpack config

module.exports = {
	resolve: {
		alias: {
			src: path.resolve(__dirname, 'src'),
		}
	}
	// ...rest of the config
}
```

And in your `tsconfig.json`, add the following lines to the `compilerOptions`:

```
{
  "compilerOptions": {
    "baseUrl": ".",
    "paths": {
      "ts/*": ["src/ts/*"]
    }
    // ...rest of the compiler options
  }
  // ...rest of the config
}
```
Now any import paths that start with `'src/'` will correctly be resolved, regardless of the location of the importing file.

