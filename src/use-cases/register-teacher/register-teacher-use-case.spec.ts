import { expect, describe, it, beforeEach } from 'vitest'
import { RegisterTeacherUseCase } from '@/use-cases/register-teacher'
import { InMemoryTeacherRepository } from '@/repositories/in-memory/in-memory-teachers.repository'
import { ERROR_LIST } from '@/constants/erros'
import { compare } from 'bcryptjs'
// import { ERROR_LIST } from '@/constants/erros'

let inMemoryTeachers: InMemoryTeacherRepository
let registerTeacher: RegisterTeacherUseCase

describe('Register Teacher User Case', () => {
  beforeEach(() => {
    inMemoryTeachers = new InMemoryTeacherRepository()
    registerTeacher = new RegisterTeacherUseCase(inMemoryTeachers)
  })

  it('should hash password uppon registration', async () => {
    const password = '101010'

    const { teacher } = await registerTeacher.execute({
      email: 'ricaro998@gmail',
      name: 'Ricardo',
      password,
    })

    const isPasswordCorrectlyHashed = await compare(
      password,
      teacher.password_hash
    )

    expect(isPasswordCorrectlyHashed).toBe(true)
  })

  it('should be able to register a teacher', async () => {
    const password = '101010'

    const { teacher } = await registerTeacher.execute({
      email: 'ricaro998@gmail',
      name: 'Ricardo',
      password,
    })

    const UUID_REGEX =
      /^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[1-5][0-9a-fA-F]{3}-[89abAB][0-9a-fA-F]{3}-[0-9a-fA-F]{12}$/

    // expect(user.id).toBe(expect.any(String))
    const isValidUUID = UUID_REGEX.test(teacher.id)
    expect(isValidUUID).toBe(true)
  })

  it('should not be able to register a teacher with same email', async () => {
    const password = '101010'

    await registerTeacher.execute({
      email: 'ricaro998@gmail',
      name: 'Ricardo',
      password,
    })

    let messageError = ''

    try {
      await registerTeacher.execute({
        email: 'ricaro998@gmail',
        name: 'Ricardo',
        password,
      })
    } catch (err) {
      messageError = String(err)
    }

    expect(
      messageError.includes(ERROR_LIST.REGISTER_TEACHER.EMAIL_ALREADY_EXISTS)
    ).toBe(true)
  })
})
