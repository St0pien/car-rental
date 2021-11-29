<script>
  let login = "";
  let password = "";
  let repeat = "";
  let status = "";
  let ok = false;

  const submit = async () => {
    status = '';
    if (password != repeat) {
      status = "Passwords don't match";
      return;
    }

    const res = await (
      await fetch("../public/server/views/user.php", {
        method: "POST",
        headers: {
          "Content-Type": "application/json",
        },
        body: JSON.stringify({
          action: "register",
          login,
          password,
        }),
      })
    ).json();

    if (res.status == "Registration successful!") {
      ok = true;
      return;
    };
    status = res.status;
  };
</script>

<main class="wrapper">
  <form>
    <h2 class="message">{status}</h2>
    <div class="mb-4">
      <label class="block text-md font-light mb-2" for="username"
        >Username</label
      >
      <input
        class="w-full bg-drabya-gray border-gray-500 appearance-none border p-4 font-light leading-tight focus:outline-none focus:shadow-outline"
        type="text"
        name="username"
        placeholder="Username"
        required
        bind:value={login}
      />
    </div>
    <div class="mb-4">
      <label class="block text-md font-light mb-2" for="password"
        >Password</label
      >
      <input
        class="w-full bg-drabya-gray border-gray-500 appearance-none border p-4 font-light leading-tight focus:outline-none focus:shadow-outline"
        type="password"
        name="password"
        placeholder="Password"
        required
        bind:value={password}
      />
    </div>

    <div class="mb-4">
      <label class="block text-md font-light mb-2" for="password"
        >Repeat password</label
      >
      <input
        class="w-full bg-drabya-gray border-gray-500 appearance-none border p-4 font-light leading-tight focus:outline-none focus:shadow-outline"
        type="password"
        name="password"
        placeholder="Repeat password"
        required
        bind:value={repeat}
      />
    </div>

    {#if ok}
      <h2>Registration successful! Please <a href="#/login">login!</a></h2>
      <br />
    {/if}

    <div class="flex items-center justify-between mb-5">
      <button
        class="bg-indigo-600 hover:bg-blue-700 text-white font-light py-2 px-6 rounded focus:outline-none focus:shadow-outline"
        type="button"
        on:click={submit}
      >
        REGISTER
      </button>
    </div>
  </form>
</main>

<style>
  .wrapper {
    width: "100%";
    padding: 3em 5%;
  }

  .message {
    color: red;
    text-align: center;
  }

  @media (min-width: 400px) {
    .wrapper {
      display: flex;
      justify-content: center;
    }

    form {
      width: 500px;
    }
  }
</style>
