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
<header class="bg-orange-500">
    <div class="mx-auto flex h-16 max-w-screen-xl items-center gap-8 px-4 sm:px-6 lg:px-8 justify-between">
        <div class="flex flex w-1/4 justify-between items-center">
            <a class="block text-teal-600" href="index.php">
                <span class="sr-only">Home</span>
                <svg width="3rem" height="3rem" viewBox="0 0 1024 1024" class="icon" version="1.1"
                     xmlns="http://www.w3.org/2000/svg">
                    <path d="M877.387 523.945c-1.663 198.958-163.571 360.868-362.532 362.531-198.991 1.661-360.885-166.07-362.526-362.531-0.697-83.354-130.015-83.42-129.318 0 1.064 127.401 49.851 247.752 136.97 340.531 86.427 92.047 208.144 143.457 333.116 150.77 127.267 7.454 251.374-40.885 347.279-122.774 96.086-82.04 150.659-201.304 164.166-325.296 1.565-14.352 2.04-28.805 2.16-43.23 0.697-83.421-128.618-83.355-129.315-0.001z"
                          fill="#4A5699"/>
                    <path d="M152.329 500.646c1.662-198.965 163.563-360.875 362.526-362.537 83.354-0.697 83.419-130.013 0-129.317-129.524 1.081-252.396 51.567-345.385 141.68C75.465 241.564 24.097 370.538 23.011 500.646c-0.697 83.421 128.62 83.349 129.318 0z"
                          fill="#C45FA0"/>
                    <path d="M400.998 617.112c-54.167-72.265-46.168-154.096 21.221-212.268 63.03-54.412 156.255-33.802 209.578 32.46 22.13 27.497 68.54 22.901 91.441 0 26.914-26.917 22.073-64.009 0-91.44-89.215-110.859-259.653-132.629-373.618-47.204-118.817 89.062-151.202 262.422-60.284 383.718 21.095 28.142 55.432 42.548 88.465 23.196 27.799-16.282 44.387-60.192 23.197-88.462z"
                          fill="#E5594F"/>
                    <path d="M628.723 433.281c30.673 40.924 38.604 71.548 34.179 119.265 0.715-5.845 0.408-4.79-0.924 3.173-1.3 6.769-3.259 13.386-5.207 19.983-4.113 13.896-2.982 9.9-9.75 22.736-11.978 22.716-23.474 34.203-45.271 51.746-27.499 22.131-22.904 68.538 0 91.441 26.914 26.913 64.011 22.075 91.439 0 110.85-89.224 132.613-259.649 47.193-373.614-21.092-28.142-55.431-42.546-88.466-23.196-27.799 16.287-44.384 60.193-23.193 88.466z"
                          fill="#F39A2B"/>
                </svg>
            </a>

            <h1 class="text-center text-2xl font-bold text-white sm:text-3xl">QuestionAPP</h1>
        </div>

        <div class="flex flex items-center justify-end md:justify-between">

            <div class="md:flex md:items-center md:gap-12">
                <nav aria-label="Global" class="hidden md:block">
                    <ul class="flex items-center gap-6 text-sm">
                        <li>
                            <a class="text-white transition hover:text-gray-500/75" href="index.php"> Home </a>
                        </li>

                        <li>
                            <a class="text-white transition hover:text-gray-500/75" href="index.php?action=login" onclick="(() => localStorage['page'] = 'surveys')()"> Surveys </a>
                        </li>

                        <li>
                            <a class="text-white transition hover:text-gray-500/75" href="index.php?action=graphs"> Graphs </a>
                        </li>

                        <li>
                            <a class="text-white transition hover:text-gray-500/75" href="index.php?action=about"> Contact us </a>
                        </li>
                    </ul>
                </nav>

                <div class="flex items-center gap-4">
                    <div class="sm:flex sm:gap-4">
                        <div class="hidden sm:flex">
                            <a
                                    class="rounded-md bg-gray-100 px-5 py-2.5 text-sm font-medium text-red-600"
                                    href="index.php?action=login"
                            >
                                Login
                            </a>
                        </div>
                        <a
                                class="rounded-md bg-red-600 px-5 py-2.5 text-sm font-medium text-white shadow"
                                href="index.php?action=registrazione"
                        >
                            Register
                        </a>
                    </div>
                    <div class="block md:hidden">
                        <button class="rounded bg-gray-100 p-2 text-gray-600 transition hover:text-gray-600/75">
                            <svg
                                    xmlns="http://www.w3.org/2000/svg"
                                    class="h-5 w-5"
                                    fill="none"
                                    viewBox="0 0 24 24"
                                    stroke="currentColor"
                                    stroke-width="2"
                            >
                                <path stroke-linecap="round" stroke-linejoin="round" d="M4 6h16M4 12h16M4 18h16" />
                            </svg>
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</header>
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