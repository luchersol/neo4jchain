<script>
	import { goto } from '$app/navigation';
	import Title from '../../components/title.svelte';
	import { BackendAPI } from '../../stores/stores';
	let name = '';
	let password = '';

	async function login() {
		const res = await fetch(`${BackendAPI}/api/auth/login`, {
			method: 'POST',
			headers: { 'Content-Type': 'application/json' },
			body: JSON.stringify({ name, password })
		});

		if (res.ok) {
			const data = await res.json();
			localStorage.setItem('name', data.name);
			goto('/');
		} else {
			alert('Invalid credentials');
		}
	}
</script>

<Title subtitle={'Log in'}></Title>
<div class="login-container">
	<div class="login-box">
		<input type="text" bind:value={name} placeholder="Name" />
		<input type="password" bind:value={password} placeholder="Password" />
		<button on:click={login}>Login</button>
	</div>
</div>

<style>
	.login-container {
		margin-top: '1px';
		display: flex;
		flex-direction: column;
		align-items: center;
		justify-content: center;
	}

	.login-box {
		background: white;
		padding: 2rem;
		border-radius: 8px;
		box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
		text-align: center;
		width: 300px;
	}

	h2 {
		margin-bottom: 1rem;
		color: #333;
	}

	input {
		width: 100%;
		padding: 0.5rem;
		margin: 0.5rem 0;
		border: 1px solid #ccc;
		border-radius: 4px;
	}

	button {
		width: 100%;
		padding: 0.5rem;
		background-color: #007bff;
		color: white;
		border: none;
		border-radius: 4px;
		cursor: pointer;
		margin-top: 1rem;
	}

	button:hover {
		background-color: #0056b3;
	}
</style>
