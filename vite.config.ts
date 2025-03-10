import type { UserConfig } from 'vite';
import { sveltekit } from '@sveltejs/kit/vite';

// @ts-expect-error process is a nodejs global
const host = process.env.TAURI_DEV_HOST;

export default {
	plugins: [sveltekit()],
	clearScreen: false,
	server: {
		port: 1420,
		strictPort: true,
		host: host || false,
		hmr:
			host ?
				{
					protocol: 'ws',
					host,
					port: 1421,
				}
			:	undefined,
		watch: {
			ignored: ['**/src-tauri/**'],
		},
	},
} satisfies UserConfig;
