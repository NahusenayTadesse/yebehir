<script lang="ts">
	import { Card, CardContent } from '$lib/components/ui/card';
	import { Avatar, AvatarImage, AvatarFallback } from '$lib/components/ui/avatar';
	type TeamMember = {
		name: string;
		position: string;
		avatar: string;
		description: string;
	};

	const { member }: { member: TeamMember } = $props();

	/** Get initials from name for avatar fallback */
	const getInitials = (name: string): string => {
		return name
			.split(' ')
			.map((n) => n[0])
			.join('')
			.toUpperCase()
			.slice(0, 2);
	};
</script>

<Card
	class="group shadow-lg-lg hover:shadow-lg-xl hover:shadow-lg-primary/10 h-full border-0 bg-linear-to-b from-card to-card/50 transition-all duration-300 hover:-translate-y-1"
>
	<CardContent class="flex flex-col items-center p-6 text-center">
		<!-- Avatar with ring effect on hover -->
		<div class="relative mb-4">
			<div
				class="absolute -inset-1 rounded-full bg-linear-to-r from-primary/50 to-primary/20 opacity-0 blur transition-opacity duration-300 group-hover:opacity-100"
			></div>
			<Avatar
				class="relative size-24 border-2 border-border transition-transform duration-300 group-hover:scale-105"
			>
				<AvatarImage src={member.avatar} alt={member.name} class="object-cover" />
				<AvatarFallback class="bg-primary/10 text-lg font-semibold text-primary">
					{getInitials(member.name)}
				</AvatarFallback>
			</Avatar>
		</div>

		<!-- Name -->
		<h3
			class="mb-1 text-lg font-semibold text-foreground transition-colors duration-300 group-hover:text-primary"
		>
			{member.name}
		</h3>

		<!-- Position -->
		<p class="mb-3 text-sm font-medium text-primary/80">
			{member.position}
		</p>

		<!-- Description -->
		<p class="line-clamp-3 text-sm leading-relaxed text-muted-foreground">
			{member.description}
		</p>
	</CardContent>
</Card>
