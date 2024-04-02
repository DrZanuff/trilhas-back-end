/*
  Warnings:

  - You are about to drop the column `actual_secondary_quest` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `chip_connection` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `chip_recharge` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `consumable_energy_orb` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `consumable_energy_orb_quantity` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `consumable_life_orb` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `consumable_life_orb_quantity` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `consumable_shield_orb` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `consumable_shield_orb_quantity` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `consumable_supreme_orb` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `consumable_supreme_orb_quantity` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `name_char` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `skill_180_sword` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `skill_360_sword` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `skill_laser_arrow` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `skill_rain_arrow` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `skill_triple_arrow` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `weapon_bow` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `weapon_rod` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `weapon_sword` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `xp_actual` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `locale` on the `students` table. All the data in the column will be lost.
  - You are about to drop the column `mouse_icon_scale` on the `students` table. All the data in the column will be lost.
  - You are about to drop the column `save_volume` on the `students` table. All the data in the column will be lost.
  - You are about to drop the column `save_volume_music` on the `students` table. All the data in the column will be lost.
  - You are about to drop the column `save_volume_sfx` on the `students` table. All the data in the column will be lost.

*/
-- AlterTable
ALTER TABLE "saves" DROP COLUMN "actual_secondary_quest",
DROP COLUMN "chip_connection",
DROP COLUMN "chip_recharge",
DROP COLUMN "consumable_energy_orb",
DROP COLUMN "consumable_energy_orb_quantity",
DROP COLUMN "consumable_life_orb",
DROP COLUMN "consumable_life_orb_quantity",
DROP COLUMN "consumable_shield_orb",
DROP COLUMN "consumable_shield_orb_quantity",
DROP COLUMN "consumable_supreme_orb",
DROP COLUMN "consumable_supreme_orb_quantity",
DROP COLUMN "name_char",
DROP COLUMN "skill_180_sword",
DROP COLUMN "skill_360_sword",
DROP COLUMN "skill_laser_arrow",
DROP COLUMN "skill_rain_arrow",
DROP COLUMN "skill_triple_arrow",
DROP COLUMN "weapon_bow",
DROP COLUMN "weapon_rod",
DROP COLUMN "weapon_sword",
DROP COLUMN "xp_actual",
ADD COLUMN     "game_save" BYTEA;

-- AlterTable
ALTER TABLE "students" DROP COLUMN "locale",
DROP COLUMN "mouse_icon_scale",
DROP COLUMN "save_volume",
DROP COLUMN "save_volume_music",
DROP COLUMN "save_volume_sfx",
ADD COLUMN     "user_cfg" BYTEA;
