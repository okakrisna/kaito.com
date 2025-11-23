/*
  # Add hero_background_image field

  1. Changes
    - Add `hero_background_image` text field to store hero section background image
    - This field stores base64 encoded image or URL for the hero section background
  
  2. Notes
    - Field is nullable to maintain backward compatibility
    - No default value to preserve existing data
*/

DO $$ 
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM information_schema.columns 
    WHERE table_name = 'timeless_content' 
    AND column_name = 'hero_background_image'
  ) THEN
    ALTER TABLE timeless_content ADD COLUMN hero_background_image text;
  END IF;
END $$;
