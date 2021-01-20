USE CSD220_LAB1_BRETTMARSHALL;

update room 
set 
`room type` = 'utility'
where `room type` = 'office' and `room has window` = false; 

delete from room
where `building code` = 'HOT' and `room type` = 'bathroom' and `room has window` = true;