<script lang="ts">
	import { Card, CardHeader, CardTitle, CardDescription } from '$lib/components/ui/card';
	import { LayersIcon } from '@lucide/svelte';
	type Service = {
		id: number;
		name: string;
		description: string | null;
	};

	const { service }: { service: Service } = $props();
</script>

<Card
	class="group hover:shadow-lg-lg hover:shadow-lg-primary/5 transition-all duration-300 hover:-translate-y-1"
>
	<CardHeader>
		<div
			class="mb-3 flex size-10 items-center justify-center rounded-lg bg-primary/10 text-primary transition-colors group-hover:bg-primary group-hover:text-primary-foreground"
		>
			<LayersIcon class="size-5" />
		</div>
		<CardTitle class="text-lg">{service.name}</CardTitle>
		{#if service.description}
			<CardDescription class="line-clamp-3">{service.description}</CardDescription>
		{/if}
	</CardHeader>
</Card>
