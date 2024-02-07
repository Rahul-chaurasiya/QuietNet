# QuietNet
### QuietNet is a new-age pseudonymous social network that allows users to share their true stories by hiding their real identity so that they can express themselves freely.
### On QuietNet, anyone can share their thoughts using a pseudonymous username. The app aims to provide an anonymous social network for everyone to speak the truth fearlessly, challenge the stereotypes and discover the reality.


https://github.com/Rahul-chaurasiya/QuietNet/assets/77222540/0d35c3c2-0f3c-4ccb-b63f-24312bad357a


## Key Features

### Registration Module:
- The registration module consists of three pages, likely including a sign-up page, a profile creation page, and a confirmation page.
- Users provide information such as a pseudonymous username, email, password, and optionally, additional profile details.
- This information is stored in the user table in the database.

### Profile Management:
- Users can update their profiles, which includes modifying their pseudonymous username, email, profile picture, bio, and other details.
- These profile updates are reflected in the user table in the database.

### Main Page:
- The main page displays all posts from users.
- Users can select a topic to discuss, and when they click on a post, they can view the post details and share their thoughts.
- Posts are stored in the post table in the database. Each post is associated with the user who created it via the pUserid foreign key.

### Sharing Thoughts:
- Users can share their thoughts on existing topics or create new topics if their desired topic title is not present.
- When users share their thoughts, a new post is created and added to the post table in the database.

### Like Functionality:
- Users can like posts to express their appreciation or agreement.
- Likes are stored in the like table in the database, where each like is associated with a specific post and user.

### Sign-in/Sign-out System:
- QuietNet has a robust sign-in/sign-out system to authenticate users and protect their accounts.
- User authentication is managed using session management techniques, likely involving cookies or session tokens.

### Database Tables and Relationships:
- The user table stores user information and is connected to posts via the pUserid foreign key.
- The post table stores posts created by users and is connected to the user table via the pUserid foreign key.
- The like table stores information about likes on posts and is connected to both the user and post tables.
- The comment table stores comments made by users on posts and is connected to both the user and post tables.

