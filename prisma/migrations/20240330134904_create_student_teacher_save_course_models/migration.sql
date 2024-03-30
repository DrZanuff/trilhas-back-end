-- CreateTable
CREATE TABLE "teachers" (
    "id" TEXT NOT NULL,
    "teacherName" TEXT NOT NULL,
    "teacherID" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password_hash" TEXT NOT NULL,

    CONSTRAINT "teachers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "courses" (
    "id" TEXT NOT NULL,
    "courseName" TEXT NOT NULL,
    "courseID" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "teacherId" TEXT NOT NULL,
    "studentId" TEXT,

    CONSTRAINT "courses_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "students" (
    "id" TEXT NOT NULL,
    "studentName" TEXT NOT NULL,
    "studentID" TEXT NOT NULL,
    "saveVolume" INTEGER NOT NULL,
    "saveVolumeMusic" INTEGER NOT NULL,
    "saveVolumeSFX" INTEGER NOT NULL,
    "email" TEXT NOT NULL,
    "password_hash" TEXT NOT NULL,

    CONSTRAINT "students_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "saves" (
    "id" TEXT NOT NULL,
    "nameChar" TEXT NOT NULL,
    "levelPlayer" INTEGER NOT NULL,
    "xpActual" INTEGER NOT NULL,
    "timePlayed" INTEGER NOT NULL,
    "actualQuest" TEXT NOT NULL,
    "actualSecondaryQuest" INTEGER NOT NULL,
    "weaponBow" BOOLEAN NOT NULL DEFAULT false,
    "weaponSword" BOOLEAN NOT NULL DEFAULT false,
    "weaponRod" BOOLEAN NOT NULL DEFAULT false,
    "skillLaserArrow" BOOLEAN NOT NULL DEFAULT false,
    "skillRainArrow" BOOLEAN NOT NULL DEFAULT false,
    "skillTripleArrow" BOOLEAN NOT NULL DEFAULT false,
    "skill180Sword" BOOLEAN NOT NULL DEFAULT false,
    "skill360Sword" BOOLEAN NOT NULL DEFAULT false,
    "consumableEnergyOrb" BOOLEAN NOT NULL DEFAULT false,
    "consumableShieldOrb" BOOLEAN NOT NULL DEFAULT false,
    "consumableSupremeOrb" BOOLEAN NOT NULL DEFAULT false,
    "consumableLifeOrb" BOOLEAN NOT NULL DEFAULT false,
    "consumableEnergyOrbQuantity" INTEGER NOT NULL DEFAULT 0,
    "consumableShieldOrbQuantity" INTEGER NOT NULL DEFAULT 0,
    "consumableSupremeOrbQuantity" INTEGER NOT NULL DEFAULT 0,
    "consumableLifeOrbQuantity" INTEGER NOT NULL DEFAULT 0,
    "chipRecharge" BOOLEAN NOT NULL DEFAULT false,
    "chipConnection" BOOLEAN NOT NULL DEFAULT false,
    "courseId" TEXT,
    "studentId" TEXT NOT NULL,

    CONSTRAINT "saves_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "teachers_teacherID_key" ON "teachers"("teacherID");

-- CreateIndex
CREATE UNIQUE INDEX "teachers_email_key" ON "teachers"("email");

-- CreateIndex
CREATE UNIQUE INDEX "courses_courseID_key" ON "courses"("courseID");

-- CreateIndex
CREATE UNIQUE INDEX "courses_code_key" ON "courses"("code");

-- CreateIndex
CREATE UNIQUE INDEX "students_studentID_key" ON "students"("studentID");

-- CreateIndex
CREATE UNIQUE INDEX "students_email_key" ON "students"("email");

-- AddForeignKey
ALTER TABLE "courses" ADD CONSTRAINT "courses_teacherId_fkey" FOREIGN KEY ("teacherId") REFERENCES "teachers"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "courses" ADD CONSTRAINT "courses_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES "students"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "saves" ADD CONSTRAINT "saves_studentId_fkey" FOREIGN KEY ("studentId") REFERENCES "students"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
