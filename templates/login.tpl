<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <script src="https://cdn.tailwindcss.com"></script>
    <title>Survey</title>
</head>
<body>
<div class="mx-auto max-w-screen-xl px-4 py-16 sm:px-6 lg:px-8">
    <div class="mx-auto max-w-lg">
        <h1 class="text-center text-2xl font-bold text-orange-500 sm:text-3xl">Welcome to QuestionAPP</h1>

        <p class="mx-auto mt-4 max-w-md text-center text-gray-500">
            Enter now and start filling out any type of survey.
        </p>


        <div class="mb-0 mt-6 space-y-4 rounded-lg p-4 shadow-lg sm:p-6 lg:p-8">
            <form action="index.php" method="post" class="mb-0 mt-6 space-y-4" onsubmit="loginForm(event)" id="form">
                <p class="text-center text-lg font-medium">Sign in to your account</p>

                <div>
                    <label for="email" class="sr-only">Email</label>

                    <div class="relative">
                        <input
                                type="email"
                                class="w-full rounded-lg border-gray-200 p-4 pe-12 text-sm shadow-md"
                                placeholder="Enter email"
                                name="mail"
                                required
                        />

                        <span class="absolute inset-y-0 end-0 grid place-content-center px-4">
            <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="size-4 text-gray-400"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
            >
              <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M16 12a4 4 0 10-8 0 4 4 0 008 0zm0 0v1.5a2.5 2.5 0 005 0V12a9 9 0 10-9 9m4.5-1.206a8.959 8.959 0 01-4.5 1.207"
              />
            </svg>
          </span>
                    </div>
                </div>

                <div>
                    <label for="password" class="sr-only">Password</label>

                    <div class="relative">
                        <input
                                type="password"
                                class="w-full rounded-lg border-gray-200 p-4 pe-12 text-sm shadow-md"
                                placeholder="Enter password"
                                name="password"
                                required
                        />

                        <span class="absolute inset-y-0 end-0 grid place-content-center px-4">
            <svg
                    xmlns="http://www.w3.org/2000/svg"
                    class="size-4 text-gray-400"
                    fill="none"
                    viewBox="0 0 24 24"
                    stroke="currentColor"
            >
              <!-- <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"
              /> -->
              <path
                      stroke-linecap="round"
                      stroke-linejoin="round"
                      stroke-width="2"
                      d="M15 9H15.01M15 15C18.3137 15 21 12.3137 21 9C21 5.68629 18.3137 3 15 3C11.6863 3 9 5.68629 9 9C9 9.27368 9.01832 9.54308 9.05381 9.80704C9.11218 10.2412 9.14136 10.4583 9.12172 10.5956C9.10125 10.7387 9.0752 10.8157 9.00469 10.9419C8.937 11.063 8.81771 11.1823 8.57913 11.4209L3.46863 16.5314C3.29568 16.7043 3.2092 16.7908 3.14736 16.8917C3.09253 16.9812 3.05213 17.0787 3.02763 17.1808C3 17.2959 3 17.4182 3 17.6627V19.4C3 19.9601 3 20.2401 3.10899 20.454C3.20487 20.6422 3.35785 20.7951 3.54601 20.891C3.75992 21 4.03995 21 4.6 21H6.33726C6.58185 21 6.70414 21 6.81923 20.9724C6.92127 20.9479 7.01881 20.9075 7.10828 20.8526C7.2092 20.7908 7.29568 20.7043 7.46863 20.5314L12.5791 15.4209C12.8177 15.1823 12.937 15.063 13.0581 14.9953C13.1843 14.9248 13.2613 14.8987 13.4044 14.8783C13.5417 14.8586 13.7588 14.8878 14.193 14.9462C14.4569 14.9817 14.7263 15 15 15Z"
              />
            </svg>
          </span>
                    </div>
                </div>

                <button
                        type="submit"
                        class="block w-full rounded-lg bg-orange-500 px-5 py-3 text-sm font-medium text-white"
                >
                    Sign in
                </button>
            </form>

            <p class="text-center text-sm text-gray-500">
                No account?
                <a class="underline" href="index.php?action=registrazione"> Sign up </a>
            </p>

        </div>
    </div>
</div>
<script>
    console.log(localStorage['page'] ? ("index.php?action=" + localStorage['page']) : "index.php")

    function loginForm(event){
        event.preventDefault();

        const formData = new FormData(document.getElementById('form'));

        fetch('index.php', {
            method: "POST",
            body: formData
        }).then(() => {
            window.location.replace(localStorage['page'] ? ("index.php?action=" + localStorage['page']) : "index.php");
            localStorage.removeItem('page');
        })
    }
</script>
</body>
</html>