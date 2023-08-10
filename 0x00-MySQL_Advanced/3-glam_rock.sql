-- ranks longevity of bands with Glam rock as their main style
-- Query to get list of bands with Glam rock as their main style
SELECT band_name, COALESCE(split, 2022) - formed 
AS lifespan FROM metal_bands
WHERE style LIKE '%Glam rock%';
