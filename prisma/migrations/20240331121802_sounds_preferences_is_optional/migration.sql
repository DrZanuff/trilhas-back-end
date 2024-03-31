-- AlterTable
ALTER TABLE "students" ALTER COLUMN "save_volume" DROP NOT NULL,
ALTER COLUMN "save_volume" SET DEFAULT 0,
ALTER COLUMN "save_volume_music" DROP NOT NULL,
ALTER COLUMN "save_volume_music" SET DEFAULT 0,
ALTER COLUMN "save_volume_sfx" DROP NOT NULL,
ALTER COLUMN "save_volume_sfx" SET DEFAULT 0;
