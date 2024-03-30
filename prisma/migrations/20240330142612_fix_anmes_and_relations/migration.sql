/*
  Warnings:

  - You are about to drop the column `courseID` on the `courses` table. All the data in the column will be lost.
  - You are about to drop the column `courseName` on the `courses` table. All the data in the column will be lost.
  - You are about to drop the column `studentId` on the `courses` table. All the data in the column will be lost.
  - You are about to drop the column `teacherId` on the `courses` table. All the data in the column will be lost.
  - You are about to drop the column `actualQuest` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `actualSecondaryQuest` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `chipConnection` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `chipRecharge` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `consumableEnergyOrb` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `consumableEnergyOrbQuantity` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `consumableLifeOrb` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `consumableLifeOrbQuantity` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `consumableShieldOrb` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `consumableShieldOrbQuantity` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `consumableSupremeOrb` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `consumableSupremeOrbQuantity` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `courseId` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `levelPlayer` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `nameChar` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `skill180Sword` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `skill360Sword` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `skillLaserArrow` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `skillRainArrow` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `skillTripleArrow` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `studentId` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `timePlayed` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `weaponBow` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `weaponRod` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `weaponSword` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `xpActual` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `saveVolume` on the `students` table. All the data in the column will be lost.
  - You are about to drop the column `saveVolumeMusic` on the `students` table. All the data in the column will be lost.
  - You are about to drop the column `saveVolumeSFX` on the `students` table. All the data in the column will be lost.
  - You are about to drop the column `studentID` on the `students` table. All the data in the column will be lost.
  - You are about to drop the column `studentName` on the `students` table. All the data in the column will be lost.
  - You are about to drop the column `teacherID` on the `teachers` table. All the data in the column will be lost.
  - You are about to drop the column `teacherName` on the `teachers` table. All the data in the column will be lost.
  - Added the required column `course_name` to the `courses` table without a default value. This is not possible if the table is not empty.
  - Added the required column `student_id` to the `courses` table without a default value. This is not possible if the table is not empty.
  - Added the required column `teacher_id` to the `courses` table without a default value. This is not possible if the table is not empty.
  - Added the required column `actual_quest` to the `saves` table without a default value. This is not possible if the table is not empty.
  - Added the required column `actual_secondary_quest` to the `saves` table without a default value. This is not possible if the table is not empty.
  - Added the required column `level_player` to the `saves` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name_char` to the `saves` table without a default value. This is not possible if the table is not empty.
  - Added the required column `student_id` to the `saves` table without a default value. This is not possible if the table is not empty.
  - Added the required column `time_played` to the `saves` table without a default value. This is not possible if the table is not empty.
  - Added the required column `xp_actual` to the `saves` table without a default value. This is not possible if the table is not empty.
  - Added the required column `save_volume` to the `students` table without a default value. This is not possible if the table is not empty.
  - Added the required column `save_volume_music` to the `students` table without a default value. This is not possible if the table is not empty.
  - Added the required column `save_volume_sfx` to the `students` table without a default value. This is not possible if the table is not empty.
  - Added the required column `student_name` to the `students` table without a default value. This is not possible if the table is not empty.
  - Added the required column `teacher_name` to the `teachers` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE "courses" DROP CONSTRAINT "courses_studentId_fkey";

-- DropForeignKey
ALTER TABLE "courses" DROP CONSTRAINT "courses_teacherId_fkey";

-- DropForeignKey
ALTER TABLE "saves" DROP CONSTRAINT "saves_studentId_fkey";

-- DropIndex
DROP INDEX "courses_courseID_key";

-- DropIndex
DROP INDEX "students_studentID_key";

-- DropIndex
DROP INDEX "teachers_teacherID_key";

-- AlterTable
ALTER TABLE "courses" DROP COLUMN "courseID",
DROP COLUMN "courseName",
DROP COLUMN "studentId",
DROP COLUMN "teacherId",
ADD COLUMN     "course_name" TEXT NOT NULL,
ADD COLUMN     "student_id" TEXT NOT NULL,
ADD COLUMN     "teacher_id" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "saves" DROP COLUMN "actualQuest",
DROP COLUMN "actualSecondaryQuest",
DROP COLUMN "chipConnection",
DROP COLUMN "chipRecharge",
DROP COLUMN "consumableEnergyOrb",
DROP COLUMN "consumableEnergyOrbQuantity",
DROP COLUMN "consumableLifeOrb",
DROP COLUMN "consumableLifeOrbQuantity",
DROP COLUMN "consumableShieldOrb",
DROP COLUMN "consumableShieldOrbQuantity",
DROP COLUMN "consumableSupremeOrb",
DROP COLUMN "consumableSupremeOrbQuantity",
DROP COLUMN "courseId",
DROP COLUMN "levelPlayer",
DROP COLUMN "nameChar",
DROP COLUMN "skill180Sword",
DROP COLUMN "skill360Sword",
DROP COLUMN "skillLaserArrow",
DROP COLUMN "skillRainArrow",
DROP COLUMN "skillTripleArrow",
DROP COLUMN "studentId",
DROP COLUMN "timePlayed",
DROP COLUMN "weaponBow",
DROP COLUMN "weaponRod",
DROP COLUMN "weaponSword",
DROP COLUMN "xpActual",
ADD COLUMN     "actual_quest" TEXT NOT NULL,
ADD COLUMN     "actual_secondary_quest" INTEGER NOT NULL,
ADD COLUMN     "chip_connection" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "chip_recharge" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "consumable_energy_orb" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "consumable_energy_orb_quantity" INTEGER NOT NULL DEFAULT 0,
ADD COLUMN     "consumable_life_orb" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "consumable_life_orb_quantity" INTEGER NOT NULL DEFAULT 0,
ADD COLUMN     "consumable_shield_orb" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "consumable_shield_orb_quantity" INTEGER NOT NULL DEFAULT 0,
ADD COLUMN     "consumable_supreme_orb" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "consumable_supreme_orb_quantity" INTEGER NOT NULL DEFAULT 0,
ADD COLUMN     "course_id" TEXT,
ADD COLUMN     "level_player" INTEGER NOT NULL,
ADD COLUMN     "name_char" TEXT NOT NULL,
ADD COLUMN     "skill_180_sword" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "skill_360_sword" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "skill_laser_arrow" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "skill_rain_arrow" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "skill_triple_arrow" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "student_id" TEXT NOT NULL,
ADD COLUMN     "time_played" INTEGER NOT NULL,
ADD COLUMN     "weapon_bow" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "weapon_rod" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "weapon_sword" BOOLEAN NOT NULL DEFAULT false,
ADD COLUMN     "xp_actual" INTEGER NOT NULL;

-- AlterTable
ALTER TABLE "students" DROP COLUMN "saveVolume",
DROP COLUMN "saveVolumeMusic",
DROP COLUMN "saveVolumeSFX",
DROP COLUMN "studentID",
DROP COLUMN "studentName",
ADD COLUMN     "save_volume" INTEGER NOT NULL,
ADD COLUMN     "save_volume_music" INTEGER NOT NULL,
ADD COLUMN     "save_volume_sfx" INTEGER NOT NULL,
ADD COLUMN     "student_name" TEXT NOT NULL;

-- AlterTable
ALTER TABLE "teachers" DROP COLUMN "teacherID",
DROP COLUMN "teacherName",
ADD COLUMN     "teacher_name" TEXT NOT NULL;

-- AddForeignKey
ALTER TABLE "courses" ADD CONSTRAINT "courses_teacher_id_fkey" FOREIGN KEY ("teacher_id") REFERENCES "teachers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "courses" ADD CONSTRAINT "courses_student_id_fkey" FOREIGN KEY ("student_id") REFERENCES "students"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "saves" ADD CONSTRAINT "saves_student_id_fkey" FOREIGN KEY ("student_id") REFERENCES "students"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
