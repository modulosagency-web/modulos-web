CREATE TABLE IF NOT EXISTS public.qr_links (
  id TEXT PRIMARY KEY,
  label TEXT,
  target_url TEXT,
  owner_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
  updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

ALTER TABLE public.qr_links ENABLE ROW LEVEL SECURITY;

-- Anyone can check QR destinations
CREATE POLICY "Public can read QR destinations"
ON public.qr_links
FOR SELECT
TO anon, authenticated
USING (true);

-- Logged-in owner can create QR codes
CREATE POLICY "Owner can create QR"
ON public.qr_links
FOR INSERT
TO authenticated
WITH CHECK (auth.uid() = owner_id);

-- Only QR owner can update the target link
CREATE POLICY "Owner can update QR"
ON public.qr_links
FOR UPDATE
TO authenticated
USING (auth.uid() = owner_id)
WITH CHECK (auth.uid() = owner_id);

GRANT SELECT ON public.qr_links TO anon, authenticated;
GRANT INSERT, UPDATE ON public.qr_links TO authenticated;
