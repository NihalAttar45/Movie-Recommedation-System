<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="resources/AdminHomePage.css" />
    <style>
        /* Style for the modal box */
        .modal {
            display: none; /* Hidden by default */
            position: fixed;
            z-index: 9999; /* Sits above everything */
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.5); /* Dark background */
            justify-content: center;
            align-items: center;
        }

        .modal-content {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            text-align: center;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            width: 90%;
            max-width: 400px;
        }

        .modal-content h2 {
            margin-bottom: 20px;
            color: #333;
        }

        .modal-content button {
            padding: 10px 20px;
            margin: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        .confirm-btn {
            background-color: #28a745;
            color: white;
        }

        .cancel-btn {
            background-color: #dc3545;
            color: white;
        }

        /* Responsive adjustments */
        @media (max-width: 600px) {
            .modal-content {
                width: 90%;
            }

            .modal-content button {
                width: 100%;
                margin-bottom: 10px;
            }
        }
    </style>
</head>

<body>
    <header style="z-index: 1">
        <nav>
            <a href="addmovie">Add New Movie</a>
            <a href="showmovie">Show All Movies</a>
            <a href="showRegisteredUsers">Show Registered Users</a>
            <a href="showOverallRatingtoadmin">Overall Ratings</a>
            <a href="showUserWiseMovies">User Wise Movies</a>
            <a href="AddnewAdmin">Add New Admin</a>
            <a href="AllAdmin">Show All Admin</a>
            <select id="profileDropdown">
                <option value="" disabled selected hidden>Profile</option>
                <option value="viewprofileadmin">View Profile</option>
                <option value="Alogout">Logout</option>
            </select>
        </nav>
    </header>

    <div class="container">
        <!-- Content specific to AdminHomePage.jsp -->
    </div>

    <!-- The Modal -->
    <div id="logoutModal" class="modal">
        <div class="modal-content">
            <h2>Are you sure you want to logout?</h2>
            <button class="confirm-btn" id="confirmLogout">Yes, Logout</button>
            <button class="cancel-btn" id="cancelLogout">Cancel</button>
        </div>
    </div>

    <script>
        document.getElementById('profileDropdown').addEventListener('change', function (e) {
            var selectedValue = this.value;
            if (selectedValue === 'Alogout') {
                // Show the modal instead of logging out immediately
                e.preventDefault(); // Prevent the dropdown from auto-redirecting
                document.getElementById('logoutModal').style.display = 'flex';
                this.value = ""; // Reset dropdown value to hide the selection
            } else if (selectedValue) {
                window.location.href = selectedValue;
            }
        });

        // Get the modal and buttons
        var modal = document.getElementById('logoutModal');
        var confirmLogout = document.getElementById('confirmLogout');
        var cancelLogout = document.getElementById('cancelLogout');

        // Confirm logout
        confirmLogout.addEventListener('click', function () {
            window.location.href = 'Alogout'; // Redirect to logout page
        });

        // Cancel logout
        cancelLogout.addEventListener('click', function () {
            modal.style.display = 'none'; // Hide the modal
        });

        // Hide the modal if user clicks outside of it
        window.addEventListener('click', function (e) {
            if (e.target == modal) {
                modal.style.display = 'none';
            }
        });
    </script>
</body>

</html>
