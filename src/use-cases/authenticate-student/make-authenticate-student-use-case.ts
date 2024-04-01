import { PrismaStudentRepository } from '@/repositories/prisma/prisma-student-repository'
import { AuthenticateStudentUseCase } from './authenticate-student-use-case'

export function makeAuthenticateStudentUserCase() {
  const studentRepository = new PrismaStudentRepository()
  const authenticateStudent = new AuthenticateStudentUseCase(studentRepository)

  return authenticateStudent
}
