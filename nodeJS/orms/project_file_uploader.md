### Introduction

In this project, we'll be building a stripped down version of [Google Drive](https://www.google.com/drive/) (or any other personal storage service).

### Assignment

<div class="lesson-content__panel" markdown="1">

1. Set up a new project using Express and Prisma. Install all the necessary dependencies including Passport etc.
1. Set up session based authentication using Passport.js. Use the [Prisma session store library](https://github.com/kleydon/prisma-session-store#readme) to persist sessions in the database.
1. Add a form where authenticated users can upload a file. Save the file in your filesystem for now. You'll need to integrate the [multer middleware](https://github.com/expressjs/multer). We'll upload these files once we have all other features working.
1. Add folders. Users should be able to CRUD folders and upload files in them. Set up routes and necessary database interactions for this.
1. Add a route to view specific file details like name, size, and upload time. There should be a download button to allow users to download the file.
1. Finally, add logic to upload files. You could store it in a database, but it's advised to use a cloud storage service for this usecase. You can use [Cloudinary](https://cloudinary.com/) or [Supabase storage](https://supabase.com/docs/guides/storage). When a file is uploaded, save the file URL in the database.

#### Extra credit

- Add a share folder functionality. When a user wants to share a folder (and all of its contents), they should have a form to specify the duration i.e. 1d, 10d etc. This should generate a link that can be shared with anyone (unauthenticated users). For example, the link could be in the following format: `https://yourapp.com/share/c758c495-0705-44c6-8bab-6635fd12cf81`

</div>
