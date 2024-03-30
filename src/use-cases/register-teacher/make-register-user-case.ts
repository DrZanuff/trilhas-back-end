import { PrismaTeacherRepository } from '@/repositories/prisma/prisma-teachers-repository'
import { RegisterTeacherUseCase } from './register-teacher-use-case'

export function makeRegisterTeacherUserCase() {
  const teacherRepository = new PrismaTeacherRepository()
  const registerTeacjer = new RegisterTeacherUseCase(teacherRepository)

  return registerTeacjer
}
