import { expect, describe, it, beforeEach } from 'vitest'
import { AuthenticateStudentUseCase } from './authenticate-student-use-case'
import { RegisterStudentUseCase } from '@/use-cases/register-student'
import { InMemoryStudentRepository } from '@/repositories/in-memory/in-memory-student.repository'
import { ERROR_LIST } from '@/constants/erros'

let inMemoryStudents: InMemoryStudentRepository
let authenticateStudent: AuthenticateStudentUseCase
let registerStudent: RegisterStudentUseCase

describe('Authenticate Student User Case', () => {
  beforeEach(() => {
    inMemoryStudents = new InMemoryStudentRepository()
    authenticateStudent = new AuthenticateStudentUseCase(inMemoryStudents)
    registerStudent = new RegisterStudentUseCase(inMemoryStudents)
  })

  it('should be able to authenticate a student', async () => {
    const password = '101010'

    await registerStudent.execute({
      email: 'ricaro998@gmail',
      name: 'Ricardo',
      password,
    })

    const { student } = await authenticateStudent.execute({
      email: 'ricaro998@gmail',
      password,
    })

    const UUID_REGEX =
      /^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[1-5][0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}$/

    // expect(user.id).toBe(expect.any(String))
    const isValidUUID = UUID_REGEX.test(student.id)
    expect(isValidUUID).toBe(true)
  })

  it('should not be able to authenticate a student with wrong email', async () => {
    const password = '101010'

    await registerStudent.execute({
      email: 'ricaro998@gmail',
      name: 'Ricardo',
      password,
    })

    let messageError = ''

    try {
      await authenticateStudent.execute({
        email: 'wrong_user@gmail.com',
        password,
      })
    } catch (err) {
      messageError = String(err)
    }

    expect(
      messageError.includes(ERROR_LIST.AUTH_STUDENT.INVALID_CREDENTIALS)
    ).toBe(true)
  })

  it('should not be able to authenticate a student with wrong password', async () => {
    const password = '101010'

    await registerStudent.execute({
      email: 'ricaro998@gmail',
      name: 'Ricardo',
      password,
    })

    let messageError = ''

    try {
      await authenticateStudent.execute({
        email: 'ricaro998@gmail',
        password: 'wrong_password',
      })
    } catch (err) {
      messageError = String(err)
    }

    expect(
      messageError.includes(ERROR_LIST.AUTH_STUDENT.INVALID_CREDENTIALS)
    ).toBe(true)
  })

  it('should not be able to authenticate with a non existend student', async () => {
    let messageError = ''

    try {
      await authenticateStudent.execute({
        email: 'ricaro998@gmail',
        password: '101010',
      })
    } catch (err) {
      messageError = String(err)
    }

    expect(
      messageError.includes(ERROR_LIST.AUTH_STUDENT.INVALID_CREDENTIALS)
    ).toBe(true)
  })
})
