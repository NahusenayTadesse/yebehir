import { superValidate, message, fail } from 'sveltekit-superforms';
import { zod4 } from 'sveltekit-superforms/adapters';
import { eq } from 'drizzle-orm';

import { deleteTestimonial, markRead } from './schema.js';
import { db } from '$lib/server/db';
import { contactMessages as paymentMethods, quotes } from '$lib/server/db/schema';
import type { Actions } from './$types.js';
import type { PageServerLoad } from './$types.js';

export const load: PageServerLoad = async () => {
	const readForm = await superValidate(zod4(markRead));
	const deleteForm = await superValidate(zod4(deleteTestimonial));

	const allQuotes = await db.select().from(quotes);

	return {
		readForm,
		deleteForm,
		allQuotes
	};
};

export const actions: Actions = {
	read: async ({ request, locals }) => {
		const form = await superValidate(request, zod4(deleteTestimonial));

		if (!form.valid) {
			return fail(400, { form });
		}

		const { id } = form.data;

		try {
			await db.update(quotes).set({ status: 'Replied' }).where(eq(quotes.id, id));
			return message(form, { type: 'success', text: 'Quote Successfully Marked as Read' });
		} catch (err: any) {
			return message(
				form,
				{
					type: 'error',
					text: 'Error while marking quote as read.'
				},
				{ status: 500 }
			);
		}
	},
	delete: async ({ request }) => {
		const form = await superValidate(request, zod4(deleteTestimonial));

		if (!form.valid) {
			return fail(400, { form });
		}

		const { id } = form.data;

		try {
			await db.delete(quotes).where(eq(quotes.id, id));
			return message(form, { type: 'success', text: 'Quote Successfully Deleted' });
		} catch (err: any) {
			return message(
				form,
				{
					type: 'error',
					text: 'Error while deleting quote.'
				},
				{ status: 500 }
			);
		}
	}
};
