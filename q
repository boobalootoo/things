<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Video Player</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <style>
        body {
            background-color: #0f172a;
            color: #f8fafc;
        }
        .video-container {
            position: relative;
            padding-bottom: 56.25%; /* 16:9 Aspect Ratio */
            height: 0;
            overflow: hidden;
            max-width: 100%;
            background: #000;
            border-radius: 1rem;
            box-shadow: 0 25px 50px -12px rgba(0, 0, 0, 0.5);
        }
        .video-container iframe {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            border: 0;
        }
    </style>
</head>
<body class="min-h-screen flex flex-col items-center justify-center p-4 md:p-8">

    <!-- Header Section -->
    <header class="text-center mb-8 max-w-2xl">
        <h1 class="text-3xl md:text-4xl font-bold bg-clip-text text-transparent bg-gradient-to-r from-blue-400 to-indigo-500 mb-2">
            Now Playing
        </h1>
        <p class="text-slate-400 text-sm md:text-base">
            Enjoy your selected video in a clean, distraction-free environment.
        </p>
    </header>

    <!-- Main Content -->
    <main class="w-full max-w-5xl">
        <div class="video-container">
            <iframe 
                src="https://www.youtube.com/embed/t36lxBkp-Mc?autoplay=0&rel=0" 
                title="YouTube video player" 
                allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" 
                allowfullscreen>
            </iframe>
        </div>

        <!-- Controls/Info Area -->
        <div class="mt-8 grid grid-cols-1 md:grid-cols-2 gap-6">
            <div class="bg-slate-800/50 p-6 rounded-2xl border border-slate-700">
                <h2 class="text-xl font-semibold mb-2">Video Information</h2>
                <p class="text-slate-400 text-sm">
                    This page is optimized for viewing high-definition content. Use the controls within the player to adjust quality and playback speed.
                </p>
            </div>
            <div class="bg-slate-800/50 p-6 rounded-2xl border border-slate-700 flex flex-col justify-center">
                <button 
                    onclick="copyLink()"
                    class="w-full py-3 px-6 bg-indigo-600 hover:bg-indigo-500 transition-colors rounded-xl font-medium flex items-center justify-center gap-2"
                >
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5" viewBox="0 0 20 20" fill="currentColor">
                        <path d="M15 8a3 3 0 10-2.977-2.63l-4.94 2.47a3 3 0 100 4.319l4.94 2.47a3 3 0 10.895-1.789l-4.94-2.47a3.027 3.027 0 000-.74l4.94-2.47C13.456 7.68 14.19 8 15 8z" />
                    </svg>
                    Copy Video Link
                </button>
                <p id="copy-status" class="text-center text-xs mt-2 text-indigo-400 opacity-0 transition-opacity">Link copied to clipboard!</p>
            </div>
        </div>
    </main>

    <footer class="mt-auto pt-12 pb-4 text-slate-500 text-xs">
        <p>&copy; 2026 Minimal Cinema Experience</p>
    </footer>

    <script>
        function copyLink() {
            const link = 'https://www.youtube.com/watch?v=t36lxBkp-Mc';
            const textArea = document.createElement("textarea");
            textArea.value = link;
            document.body.appendChild(textArea);
            textArea.select();
            try {
                document.execCommand('copy');
                const status = document.getElementById('copy-status');
                status.classList.remove('opacity-0');
                setTimeout(() => status.classList.add('opacity-0'), 2000);
            } catch (err) {
                console.error('Fallback copy failed', err);
            }
            document.body.removeChild(textArea);
        }
    </script>
</body>
</html>
