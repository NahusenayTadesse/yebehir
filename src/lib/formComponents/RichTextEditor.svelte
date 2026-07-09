<script lang="ts">
	import { Tipex } from '@friendofsvelte/tipex';
	import '@friendofsvelte/tipex/styles/index.css';

	let { value = $bindable(''), disabled=false, placeholder = 'Start writing...' } = $props();

	import type { Editor } from '@tiptap/core';
	let editorInstance: Editor | undefined = $state();

	$effect(() => {
		if (editorInstance) {
			editorInstance.on('update', () => {
				value = editorInstance?.getHTML() || '';
			});
		}
	});
</script>
{#if disabled}

<Tipex
	body={value}
	controlComponent={null}
	class="bg-transparent!"

/>
{:else} 
  <Tipex body={value} bind:tipex={editorInstance} focal floating />
{/if}