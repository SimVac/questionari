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
<div>
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
                                <a class="text-white transition hover:text-gray-500/75" href="index.php?action=surveys"> Surveys </a>
                            </li>

                            <li>
                                <a class="text-white transition hover:text-gray-500/75" href="index.php?action=about"> Contact us </a>
                            </li>
                        </ul>
                    </nav>

                    <div class="flex items-center gap-4">
                        <a href="index.php?action=profile">
                            <svg width="2.5rem" height="2.5rem" viewBox="0 0 1024 1024" class="icon" version="1.1"
                                 xmlns="http://www.w3.org/2000/svg">
                                <path d="M691.573 338.89c-1.282 109.275-89.055 197.047-198.33 198.331-109.292 1.282-197.065-90.984-198.325-198.331-0.809-68.918-107.758-68.998-106.948 0 1.968 167.591 137.681 303.31 305.272 305.278C660.85 646.136 796.587 503.52 798.521 338.89c0.811-68.998-106.136-68.918-106.948 0z"
                                      fill="#4A5699"/>
                                <path d="M294.918 325.158c1.283-109.272 89.051-197.047 198.325-198.33 109.292-1.283 197.068 90.983 198.33 198.33 0.812 68.919 107.759 68.998 106.948 0C796.555 157.567 660.839 21.842 493.243 19.88c-167.604-1.963-303.341 140.65-305.272 305.278-0.811 68.998 106.139 68.919 106.947 0z"
                                      fill="#C45FA0"/>
                                <path d="M222.324 959.994c0.65-74.688 29.145-144.534 80.868-197.979 53.219-54.995 126.117-84.134 201.904-84.794 74.199-0.646 145.202 29.791 197.979 80.867 54.995 53.219 84.13 126.119 84.79 201.905 0.603 68.932 107.549 68.99 106.947 0-1.857-213.527-176.184-387.865-389.716-389.721-213.551-1.854-387.885 178.986-389.721 389.721-0.601 68.991 106.349 68.933 106.949 0.001z"
                                      fill="#E5594F"/>
                            </svg>
                        </a>

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

    <section class="h-52 flex justify-center items-center ">
        <div class="flex flex-col justify-evenly h-full">
            <h1 class="text-center text-6xl font-bold text-orange-500">Explore!</h1>
            <p class="mx-auto max-w-3xl text-center text-gray-500 text-2xl">
                Browse the list of questionnaires and click on the "compile" button to start answering. Use the search bar for faster research!
            </p>
        </div>
    </section>
    <section class="flex flex-col h-3/4">

        <?php if($admin): ?>
            <div class="flex justify-around items-center pl-4">
            <div class="w-3/12">
                <form class="max-w-sm mx-auto w-10/12 pl-4">
                    <label for="default-search" class=" text-sm font-medium text-gray-900 sr-only dark:text-white">Search</label>
                    <div class="relative">
                        <div class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
                            <svg class="w-4 h-4 text-gray-500 dark:text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
                                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z"/>
                            </svg>
                        </div>
                        <input type="search" id="default-search" class="block w-full p-4 ps-10 text-sm text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-red-500 focus:border-red-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-red-500 dark:focus:border-red-500" placeholder="Search survey..." required />
                        <button type="submit" class="text-white absolute end-2.5 bottom-2.5 bg-red-500 hover:bg-red-600 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm px-4 py-2 dark:bg-red-500 dark:hover:bg-red-600 dark:focus:ring-red-600 ">Search</button>
                    </div>
                </form>
            </div>
            <div class="w-2/12">
                <div class="mt-5 space-y-4 text-sm sm:mt-0 sm:space-y-2">
                    <span class="flex items-center text-gray-500">
                        <a class="inline-block rounded border border-red-500 bg-red-500 px-12 py-3 text-sm font-medium text-white hover:bg-transparent hover:text-red-500 focus:outline-none focus:ring active:text-red-400"
                           href="index.php?action=create"
                        > Add a Survey </a>
                    </span>
                </div>
            </div>
        </div>
        <?php else: ?>
            <div>
                <form class="max-w-sm mx-auto w-10/12 pl-4">
                    <label for="default-search" class=" text-sm font-medium text-gray-900 sr-only dark:text-white">Search</label>
                    <div class="relative">
                        <div class="absolute inset-y-0 start-0 flex items-center ps-3 pointer-events-none">
                            <svg class="w-4 h-4 text-gray-500 dark:text-gray-400" aria-hidden="true" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 20 20">
                                <path stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="m19 19-4-4m0-7A7 7 0 1 1 1 8a7 7 0 0 1 14 0Z"/>
                            </svg>
                        </div>
                        <input type="search" id="default-search" class="block w-full p-4 ps-10 text-sm text-gray-900 border border-gray-300 rounded-lg bg-gray-50 focus:ring-red-500 focus:border-red-500 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-red-500 dark:focus:border-red-500" placeholder="Search survey..." required />
                        <button type="submit" class="text-white absolute end-2.5 bottom-2.5 bg-red-500 hover:bg-red-600 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm px-4 py-2 dark:bg-red-500 dark:hover:bg-red-600 dark:focus:ring-red-600 ">Search</button>
                    </div>
                </form>
            </div>
        <?php endif; ?>

        <div class="mt-4">
            <div>
                <section class=" max-w-screen-lg mx-auto px-4 md:px-8">
                    <ul class="space-y-6">
                        <?php foreach ($questionari as $questionario): ?>
                            <li class="p-5 bg-white rounded-md shadow-md">
                                <a>
                                    <div>
                                        <div class="justify-between sm:flex">
                                            <div class="flex-1">
                                                <h3 class="text-xl font-medium text-orange-600"> <?= $questionario['titolo'] ?> </h3>
                                                <p class="text-gray-500 mt-2 pr-2"><?= $questionario['descrizione'] ?></p>
                                            </div>
                                            <?php if (!$questionario['completato']): ?>
                                                <div class="mt-5 space-y-4 text-sm sm:mt-0 sm:space-y-2">
                                                <span class="flex items-center text-gray-500">
                                                    <a class="inline-block rounded border border-red-500 bg-red-500 px-12 py-3 text-sm font-medium text-white hover:bg-transparent hover:text-red-500 focus:outline-none focus:ring active:text-red-400"
                                                       href="index.php?action=compile&q=<?= $questionario['id'] ?>"
                                                    > Compile </a>
                                                </span>
                                            </div>
                                            <?php else: ?>
                                                <div class="mt-5 space-y-4 text-sm sm:mt-0 sm:space-y-2">
                                                <span class="inline-flex items-center justify-center rounded-full bg-emerald-100 px-2.5 py-0.5 text-emerald-700"
                                                >
                                                    <svg
                                                            xmlns="http://www.w3.org/2000/svg"
                                                            fill="none"
                                                            viewBox="0 0 24 24"
                                                            stroke-width="1.5"
                                                            stroke="currentColor"
                                                            class="-ms-1 me-1.5 h-6 w-6"
                                                    >
                                                        <path
                                                                stroke-linecap="round"
                                                                stroke-linejoin="round"
                                                                d="M9 12.75L11.25 15 15 9.75M21 12a9 9 0 11-18 0 9 9 0 0118 0z"
                                                        />
                                                   </svg>

                                                    <p class="whitespace-nowrap text-sm">Completed</p>
                                                </span>
                                            </div>
                                            <?php endif; ?>
                                        </div>
                                        <div class="mt-4 items-center space-y-4 text-sm sm:flex sm:space-x-4 sm:space-y-0">
                                            <span class="flex items-center text-gray-500">
                                                <svg
                                                        fill="#000000" width="1.5rem" height="1.5rem" viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                                                <path d="M6,22H18a3,3,0,0,0,3-3V7a2,2,0,0,0-2-2H17V3a1,1,0,0,0-2,0V5H9V3A1,1,0,0,0,7,3V5H5A2,2,0,0,0,3,7V19A3,3,0,0,0,6,22ZM5,12.5a.5.5,0,0,1,.5-.5h13a.5.5,0,0,1,.5.5V19a1,1,0,0,1-1,1H6a1,1,0,0,1-1-1Z"/>
                                                </svg>
                                                <span> <?= $questionario['data'] ?>  </span>
                                            </span>
                                            <span class="flex items-center text-gray-500">
                                                <svg
                                                    xmlns="http://www.w3.org/2000/svg"
                                                    class="h-5 w-5 mr-2"
                                                    viewBox="0 0 20 20"
                                                    fill="none"
                                                >
                                                <path d="M5 21C5 17.134 8.13401 14 12 14C15.866 14 19 17.134 19 21M16 7C16 9.20914 14.2091 11 12 11C9.79086 11 8 9.20914 8 7C8 4.79086 9.79086 3 12 3C14.2091 3 16 4.79086 16 7Z" stroke="#000000" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                                                </svg>
                                                    <span> <?= $questionario['nome'] . ' ' . $questionario['cognome'] ?> </span>
                                            </span>
                                        </div>
                                    </div>
                                </a>
                            </li>
                        <?php endforeach; ?>
                    </ul>
                </section>
            </div>
        </div>

    </section>

</div>
</body>
</html>