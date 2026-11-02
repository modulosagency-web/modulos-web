# Dynamic QR Dashboard

This project creates permanent QR codes with editable destination links.

## Features

- Generate unique QR codes
- Each QR code has a permanent URL
- Show "Not Targeted" if no destination is set
- Set or change destination links from the dashboard
- Redirect visitors to the saved destination
- Download QR codes as PNG images
- Protect QR editing using account authentication

## Step 1: Create Supabase Project

1. Open https://supabase.com/
2. Create a new project.
3. Open SQL Editor.
4. Paste the code from supabase.sql.
5. Click Run.

## Step 2: Configure index.html

Open index.html.

Find these lines:

const SUPABASE_URL = "PASTE_SUPABASE_PROJECT_URL_HERE";
const SUPABASE_ANON_KEY = "PASTE_SUPABASE_ANON_KEY_HERE";

Replace them with your Supabase project URL
and your public anon/publishable key.

Never use your service_role or secret key in HTML.

## Step 3: Upload to GitHub

1. Create a repository named testqr.
2. Upload index.html to the repository root.
3. Open repository Settings.
4. Open Pages.
5. Select deployment from the main branch.
6. Select the root folder.
7. Save and wait for publishing.

Your site will look like:

https://YOUR-USERNAME.github.io/testqr/

## Step 4: Create Your Account

1. Open your published website.
2. Create an account using your email and password.
3. Confirm your email if required.
4. Log in to the dashboard.

## Step 5: Generate and Target a QR

1. Click Generate QR.
2. Download the QR image.
3. Initially, scanning it shows "Not Targeted".
4. Enter a destination URL in the dashboard.
5. Click Save Target.
6. Scan the same QR again.
7. It should redirect to the saved destination.

You can change the target later without printing
a new QR code.

## Important

The QR URL stays the same, but its destination
is stored in Supabase.

GitHub Pages hosts the HTML.
Supabase stores QR IDs and destination links.
