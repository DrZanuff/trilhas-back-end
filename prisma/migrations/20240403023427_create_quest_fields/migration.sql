/*
  Warnings:

  - You are about to drop the column `actual_quest` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `level_player` on the `saves` table. All the data in the column will be lost.
  - You are about to drop the column `time_played` on the `saves` table. All the data in the column will be lost.
  - Added the required column `player_level` to the `saves` table without a default value. This is not possible if the table is not empty.
  - Added the required column `total_time_played` to the `saves` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE "saves" DROP COLUMN "actual_quest",
DROP COLUMN "level_player",
DROP COLUMN "time_played",
ADD COLUMN     "player_level" INTEGER NOT NULL,
ADD COLUMN     "total_time_played" INTEGER NOT NULL;

-- CreateTable
CREATE TABLE "quests" (
    "id" TEXT NOT NULL,
    "quest_id" INTEGER NOT NULL,
    "quest_name" TEXT NOT NULL,
    "started_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "completed_at" TIMESTAMP(3),
    "time_played" INTEGER DEFAULT 0,
    "completion_rate" INTEGER DEFAULT 0,
    "saveId" TEXT,

    CONSTRAINT "quests_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "quests_quest_id_key" ON "quests"("quest_id");

-- AddForeignKey
ALTER TABLE "quests" ADD CONSTRAINT "quests_saveId_fkey" FOREIGN KEY ("saveId") REFERENCES "saves"("id") ON DELETE SET NULL ON UPDATE CASCADE;
