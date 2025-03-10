import adapter from '@sveltejs/adapter-static';
import { vitePreprocess } from '@sveltejs/vite-plugin-svelte';
import cspDirectives from './svelte.config.csp.js';

/** @type {import('@sveltejs/kit').Config} */
const config = {
	preprocess: vitePreprocess(),
	kit: {
		csp: {
			mode: 'auto',
			directives: cspDirectives,
		},
		adapter: adapter(),
	},
};

export default config;
