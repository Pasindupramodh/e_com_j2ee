<%-- 
    Document   : iconPicker
    Created on : Nov 1, 2023, 9:15:09 AM
    Author     : pasin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Arsenal:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/github-fork-ribbon-css/0.2.3/gh-fork-ribbon.min.css" />

</head>

<body>
    <div class="d-flex justify-content-center">
        <button id="uip-select-btn" class="demo-btn demo-btn-lg btn-hover-effect btn-hover-effect--effect-4 demo-bg-1 text-white" title="Open the Icon Library">Click to open the Icon Library</button>
        <button id="uip-reset-btn" class="demo-btn demo-btn-lg btn-hover-effect btn-hover-effect--effect-4 demo-bg-danger text-white" title="Reset">Reset</button>
    </div>

    <div class="demo-output hidden" id="output">
        <pre><code class="demo-output-json" id="output-json"></code></pre>
        <div class="demo-output-icon" id="output-icon"></div>
    </div>
    <script src="plugins/universal-icon-picker/assets/js/universal-icon-picker.min.js"></script>

    <script>
         document.addEventListener('DOMContentLoaded', function(event) {
        const uip = new UniversalIconPicker('#uip-select-btn', {
            iconLibraries: [
            'happy-icons.min.json',
            'font-awesome.min.json'
            ],
            iconLibrariesCss: [
            'happy-icons.min.css',
            'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css'
            ],
            resetSelector: '#uip-reset-btn',
            onSelect: function(jsonIconData) {
                console.log(jsonIconData);
                document.getElementById('output-json').innerHTML = JSON.stringify(jsonIconData, null, 4);
                document.getElementById('output-icon').innerHTML = jsonIconData.iconHtml;
                document.getElementById('output').classList.remove('hidden');
            },
            onReset: function() {
                document.getElementById('output-json').innerHTML = '';
                document.getElementById('output-icon').innerHTML = '';
                document.getElementById('output').classList.add('hidden');
            }
            });
        });
    </script>
    </script>

</body>

</html>