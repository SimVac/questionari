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
                            <a class="text-white transition hover:text-gray-500/75" href="index.php?action=surveys"> Surveys </a>
                        </li>

                        <li>
                            <a class="text-white transition hover:text-gray-500/75" href="index.php?action=about"> Contact us </a>
                        </li>
                    </ul>
                </nav>

                <div class="flex items-center gap-4">
                    <a href="#">
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
<section>
        <div class="flex flex-row justify-evenly items-center h-[90vh]">
            <div class="rounded-lg p-4 shadow-lg flex flex-col items-center justify-evenly w-3/12 h-4/6">
                <div class="pt-4">
                    <svg width="5rem" height="5rem" viewBox="0 0 1024 1024" class="icon" version="1.1"
                         xmlns="http://www.w3.org/2000/svg">
                        <path d="M691.573 338.89c-1.282 109.275-89.055 197.047-198.33 198.331-109.292 1.282-197.065-90.984-198.325-198.331-0.809-68.918-107.758-68.998-106.948 0 1.968 167.591 137.681 303.31 305.272 305.278C660.85 646.136 796.587 503.52 798.521 338.89c0.811-68.998-106.136-68.918-106.948 0z"
                              fill="#4A5699"/>
                        <path d="M294.918 325.158c1.283-109.272 89.051-197.047 198.325-198.33 109.292-1.283 197.068 90.983 198.33 198.33 0.812 68.919 107.759 68.998 106.948 0C796.555 157.567 660.839 21.842 493.243 19.88c-167.604-1.963-303.341 140.65-305.272 305.278-0.811 68.998 106.139 68.919 106.947 0z"
                              fill="#C45FA0"/>
                        <path d="M222.324 959.994c0.65-74.688 29.145-144.534 80.868-197.979 53.219-54.995 126.117-84.134 201.904-84.794 74.199-0.646 145.202 29.791 197.979 80.867 54.995 53.219 84.13 126.119 84.79 201.905 0.603 68.932 107.549 68.99 106.947 0-1.857-213.527-176.184-387.865-389.716-389.721-213.551-1.854-387.885 178.986-389.721 389.721-0.601 68.991 106.349 68.933 106.949 0.001z"
                              fill="#E5594F"/>
                    </svg>
                </div>

                <div class="pt-4">
                    <span class="text-xl text-gray-600"><?= $user['nome'] . ' ' . $user['cognome'] ?></span>
                </div>
                <div class="w-full pt-3">
                    <label for="bio" class="block text-sm font-medium text-gray-500"> Bio </label>

                    <textarea
                            id="bio"
                            class=" p-2 mt-2 w-full rounded-lg border-gray-200 align-top shadow-sm sm:text-sm"
                            rows="4"
                            placeholder="Enter any additional order notes..."
                    ><?= $user['bio'] ?></textarea>
                </div>

                <div class="flex justify-between w-full">
                    <div class="p-3">
                        <button onclick="sendBio()" class="inline-block rounded border border-red-600 bg-red-600 px-12 py-3 text-sm font-medium text-white hover:bg-transparent hover:text-red-600 focus:outline-none focus:ring active:text-red-500">
                            Edit Bio
                        </button>
                    </div>
                    <div class="p-3">
                        <a class="inline-block rounded border border-red-600 px-12 py-3 text-sm font-medium text-red-600 hover:bg-red-600 hover:text-white focus:outline-none focus:ring active:bg-red-500" href="index.php?action=logout">
                            Logout
                        </a>
                    </div>
                </div>

            </div>
            <div class="flex flex-col h-4/6 justify-around items-center w-5/12">
                <div class="rounded-lg p-4 shadow-lg flex  justify-between  w-full">
                    <div class="flex flex-col items-start">
                        <span class="text-2xl font-bold text-orange-500">Email</span>
                        <span class="text-xl text-gray-600"><?= $user['mail'] ?></span>
                    </div>
                    <!-- <button class="h-fit inline-block rounded border border-red-600 bg-red-600 px-12 py-3 text-sm font-medium text-white hover:bg-transparent hover:text-red-600 focus:outline-none focus:ring active:text-red-500">
                        Edit
                    </button> -->
                </div>
                <div class="flex flex-row justify-between items-center w-full h-4/6">
                    <div class="rounded-lg p-4 shadow-lg flex flex-col justify-around items-start w-5/12 h-full">
                        <span class="text-2xl font-bold text-orange-500">Subscrition date</span>
                        <span class="text-xl text-gray-600"><?= $user['subscriptionDate'] ?></span>
                        <span class="text-2xl font-bold text-orange-500">Number of surveys answered</span>
                        <span class="text-xl text-gray-600"><?= $count ?></span>
                    </div>
                    <div class="rounded-lg p-4 shadow-lg flex flex-col justify-around items-start w-5/12 h-full">
                        <div class="flex flex-col justify-around h-4/6">
                            <span class="text-2xl font-bold text-orange-500 pb-2">Personal info</span>
                            <span id="gender" class="text-xl text-gray-600">Gender: <?= $user['gender'] ?></span>
                            <span id="birthday" class="text-xl text-gray-600">Birthday: <?= $user['birthday'] ?></span>
                            <span id="city" class="text-xl text-gray-600">City: <?= $user['city'] ?></span>
                        </div>

                        <div class="pt-3">
                            <button id="btnEdit" onclick="prepareData()" class="h-fit inline-block rounded border border-red-600 bg-red-600 px-12 py-3 text-sm font-medium text-white hover:bg-transparent hover:text-red-600 focus:outline-none focus:ring active:text-red-500">
                                Edit
                            </button>
                        </div>

                    </div>
                </div>
            </div>
        </div>
</section>

<script>
    function sendBio(){
        let bio = document.getElementById('bio').value
        let data = new FormData();
        data.append('modifica-bio', '');
        data.append('bio', bio);
        fetch('index.php', {
            method: 'POST',
            body: data
        }).then()
    }

    function sendData(){
        let data = new FormData();
        data.append('modifica-dati', '');
        data.append('gender', document.getElementById('gender').value);
        data.append('birthday', document.getElementById('birthday').value);
        data.append('city', document.getElementById('city').value);
        fetch('index.php', {
            method: 'POST',
            body: data
        }).then(() => window.location.reload())
    }

    function prepareData(){
        let gender = document.getElementById('gender');
        let g = gender.textContent.split(' ')[1]
        gender.outerHTML = `<select id='gender'><option ${g === 'Male' ? 'selected' : ''}>Male</option><option ${g === 'Female' ? 'selected' : ''}>Female</option></select>`
        let birthday = document.getElementById('birthday');
        birthday.outerHTML = `<input id='birthday' type='date' value='${birthday.textContent.split(' ')[1]}'>`;
        let city = document.getElementById('city');
        city.outerHTML = `<input id='city' type='text' value='${city.textContent.split(' ')[1]}'>`

        let button = document.getElementById('btnEdit')
        button.onclick = sendData;
    }
</script>
</body>
</html>